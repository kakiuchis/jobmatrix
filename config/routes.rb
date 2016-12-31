Rails.application.routes.draw do
  devise_for :users
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  resources :levelnames, except: :show
  resources :fields, except: :show do
    resources :levels, except: :show do
      resources :projects, except: :show
    end
  end

  root 'fields#index'
end
