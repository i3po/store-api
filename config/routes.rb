Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  resources :uploads
  resources :users
  resources :categories do
    resources :items
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
