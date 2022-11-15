Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Jackson
  get '/crimes', to: 'crimes#index'
  # Jackson
  get '/crimes/:id', to: 'crimes#show'
  # Arstanbek
  get '/my_crimes/new', to: 'crimes#new', as: :new_crime
end
