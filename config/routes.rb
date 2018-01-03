Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, only: [:new, :create, :show, :edit, :update]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  namespace :admin do
    resources :orders, only: [:index, :show]
    resources :dashboard, only: [:show]
  end

  namespace :designer do
    resources :dashboard, only: [:show]
  end

  namespace :producer do
    resources :dashboard, only: [:show]
  end

end
