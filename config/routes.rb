Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Jackson
  get '/crimes', to: 'crimes#index'
  # Arstanbek
  get '/crimes/new', to: 'crimes#new', as: :new_crime
  # Jackson
  get '/crimes/:id', to: 'crimes#show'
end
