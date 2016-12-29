Rails.application.routes.draw do
  resources :fields do
    resources :levels do
      resources :projects
    end
  end

  root 'fields#index'
end
