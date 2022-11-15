Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Jackson
  get '/crimes', to: 'crimes#index'
  # Jackson
  get '/crimes/:id', to: 'crimes#show'
end
