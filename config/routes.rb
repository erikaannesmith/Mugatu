Rails.application.routes.draw do
  root 'sessions#new'

  resources :users, only: [:new, :create, :show, :edit, :update]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get 'auth/google_oauth2'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  namespace :admin do
    resources :orders, only: [:index, :show]
    resources :dashboard, only: [:show]
    resources :designs, only: [:index, :show]
  end
  get 'admin/approve/design', to: 'admin/designs#approve'
  get 'admin/decline/design', to: 'admin/designs#decline'  

  namespace :designer do
    resources :dashboard, only: [:show]
    resources :designs do
      resources :applications
    end
    resources :orders
  end
  get 'designer/decline/design/application', to: 'designer/applications#decline'  
  get 'designer/approve/design/application', to: 'designer/applications#approve'
  get 'designer/design/application', to: 'designer/design/application#show'
  get 'designer/receive/order', to: 'designer/orders#receive'  

  namespace :producer do
    resources :dashboard, only: [:show]
    resources :designs, only: [:index, :show] do
      resources :applications
    end
    resources :orders
  end
  get 'producer/ship/order', to: 'producer/orders#ship'  
  

end
