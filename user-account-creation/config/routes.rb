Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "application#index"
  resources :useracc
  resources :login
  resources :logout
  resources :bookstock
  resources :searchbkname
  resources :searchbkauthor
  post '/signup', to: 'useracc#create'
end
