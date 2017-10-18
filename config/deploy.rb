lock '3.6.0'

# デプロイするアプリケーション名
set :application, 'jobmatrix'

# cloneするgitのレポジトリ（xxxxxxxx：ユーザ名、yyyyyyyy：アプリケーション名）
set :repo_url, 'https://github.com/kakiuchis/jobmatrix'

# 追記（更新されない問題）
# set :repository, "ssh://git@github.com:kakiuchis/jobmatrix.git"
set :scm, :git
set :deploy_via, :remote_cache

# deployするブランチ。デフォルトはmasterなのでなくても可。
set :branch, ENV['BRANCH'] || 'master'

# deploy先のディレクトリ。
set :deploy_to, '/var/www/jobmatrix'

# シンボリックリンクをはるフォルダ・ファイル
set :linked_files, %w{.env config/secrets.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets public/uploads}

# 保持するバージョンの個数(※後述)
set :keep_releases, 5

# Rubyのバージョン
set :rbenv_ruby, '2.3.0'
set :rbenv_type, :system

#出力するログのレベル。
set :log_level, :debug

namespace :deploy do
  desc 'Restart application'
  task :restart do
    invoke 'delayed_job:restart'
    invoke 'unicorn:restart'
  end

  desc 'Create database'
  task :db_create do
    on roles(:db) do |host|
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:create'
        end
      end
    end
  end

  desc 'Run seed'
  task :seed do
    on roles(:app) do
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:seed'
        end
      end
    end
  end

  task :stop_all_delayed_job do
    on roles(:worker) do
      within release_path do
        begin
          pids = capture(:cat, "tmp/pids/delayed_job*")
        rescue
          info "there is no delayed_job process."
          next
        end
        pids.split("\n").each do |pid_s|
          pid = pid_s.to_i
          begin
            execute(:kill, '-s', 'TERM', pid)
            Timeout.timeout(5, TimeoutError) do
              while (execute(:kill, '-s', 'EXIT', pid) rescue false)
                 sleep(0.1)
              end
            end
          rescue ::Exception => e
            puts "exception while trying to stop monitor process #{pid}: #{e}"
          end
        end
        begin; File.delete("tmp/pids/delayed_job*"); rescue ::Exception; end
      end
    end
  end

  after 'restart', 'stop_all_delayed_job'
  after 'stop_all_delayed_job', 'delayed_job:start'

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
    end
  end
end

set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }

set :delayed_job_workers, 1
set :delayed_job_roles, [:app]
