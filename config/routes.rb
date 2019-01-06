Rails.application.routes.draw do
  get 'dashboard/index'
  resources :clusters
  resources :credentials
  resources :ccs
  resources :billings
  resources :accounts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
