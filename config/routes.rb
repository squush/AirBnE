Rails.application.routes.draw do
  devise_for :users do
  end
  root to: "pages#home"

  # index show new create edit update destroy
  resources :crimes do
    resources :bookings, only: %i[new create]
  end

  get '/my_crimes', to: 'crimes#my_crimes'
  resources :users, only: %i[show] do
    # No new route for bookings. We'll just have the form directly on the crime
    # page so the user can book without going to a new page
    resources :bookings, only: %i[index show]
  end

  resources :bookings, only: %i[destroy]
end
