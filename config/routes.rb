Rails.application.routes.draw do
  root 'cocktails#index'
  resources :cocktails do
    resources :doses, only: [ :new, :create, :delete ]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
