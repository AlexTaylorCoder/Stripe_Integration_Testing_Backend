Rails.application.routes.draw do
  resources :products

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/stripe', to: 'stripe#index'
  # Defines the root path route ("/")
  # root "articles#index"
end
