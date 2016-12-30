Rails.application.routes.draw do
  resources :fields, except: :show do
    resources :levels, except: :show do
      resources :projects, except: :show
    end
  end

  root 'fields#index'
end
