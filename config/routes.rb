Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :levelnames, except: :show
  resources :fields, except: :show do
    resources :levels, except: :show do
      resources :projects, except: :show
    end
  end

  # if Rails.env.development?
  #   mount LetterOpenerWeb::Engine, at: "/letter_opener"
  # end

  root controller: 'levels', action: 'index', field_id: '1'
end
