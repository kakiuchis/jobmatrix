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

  # root '/fields/1/levels', to: 'levels#index'
  # root :to => 'levels#index'
  root controller: 'levels', action: 'index', field_id: '1'
end
