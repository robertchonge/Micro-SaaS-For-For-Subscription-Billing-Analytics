Rails.application.routes.draw do
  root 'dashboards#index'
  devise_for :users

  resources :subscriptions, only: [:index, :new, :create, :destroy]
  resources :clients do
    resources :invoices, only: [:index, :show]
  end
  resources :invoices, only: [:index, :show]

  post '/webhooks/stripe', to: 'webhooks#stripe'
  get '/dashboard', to: 'dashboards#index'
end
