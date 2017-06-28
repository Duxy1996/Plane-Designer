Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  devise_scope :user do  
   get '/users/sign_out' => 'devise/sessions#destroy'     
end
  resources :fuselages
  resources :gears
  resources :tails
  resources :wings
  resources :cabins
  resources :engines
  resources :categories
  resources :planes
  root "public#index.html"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
