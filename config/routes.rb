Rails.application.routes.draw do
 
  root 'static_pages#home'
  devise_for :users
  resources :books
  
  devise_scope :user do  
   get '/users/sign_out' => 'devise/sessions#destroy'     
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
