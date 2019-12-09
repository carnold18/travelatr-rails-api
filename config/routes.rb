Rails.application.routes.draw do
  resources :visits
  resources :expenses
  get '/countries/:id', :to => 'countries#daily_average'
  # resources :countries
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
