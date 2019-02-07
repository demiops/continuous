Rails.application.routes.draw do
  devise_for :accounts
  require 'resque/server'
  mount Resque::Server, at: '/jobs'
  get 'dashboard/index'
  get 'dashboard/login'
  get 'dashboard/signup'
  resources :clusters
  resources :credentials
  resources :ccs
  resources :billings
  resources :accounts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  
  scope 'admin' do
    root to: "dashboard#index"
    resources :ccs
    resources :billings
    resources :accounts
    resources :credentials
    resources :clusters
  end
 
  root to: "dashboard#index"
end
