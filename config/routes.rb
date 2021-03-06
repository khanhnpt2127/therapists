Rails.application.routes.draw do
  get 'landing/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 root 'landing#index'

  mount ActionCable.server => '/cable'  
  

resources :users do
  resources :reviews, module: :users
  member do
      get :hosts
    end
end

resources :reviews do
  resources :reviews
end

resources :conversations do
  resources :messages
end

resources :host_sessions

resources :hosts do
  resources :reviews, module: :hosts
  member do
    get :users
  end
end

get 'host/login' => 'sessions#new'

get 'user/login' => 'sessions#new'


resources :books

resources :surveys

resources :sessions ,only: [:new,:create]

get '/logout' => 'sessions#destroy'

get '/host_logout' => 'host_sessions#destroy'

end
