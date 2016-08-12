Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 root 'home#index'
resources :users do
  resources :reviews, module: :users
  member do
      get :hosts
    end
end


resources :hosts do
  resources :reviews, module: :hosts
  member do
    get :users
  end
end

resources :books
resources :sessions ,only: [:new,:create]

get '/logout' => 'sessions#destroy'

end
