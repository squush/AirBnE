Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # index show new create edit update destroy
  resources :crimes do
    resources :bookings, only: %i[new create]
  end

  get '/my_crimes', to: 'crimes#my_crimes'
  get '/profile', to: 'users#profile'

  get '/approve/:id', to: "bookings#approve", as: :approve_booking
  get '/reject/:id', to: "bookings#reject", as: :reject_booking

  # No new route for bookings. We'll just have the form directly on the crime
  # page so the user can book without going to a new page
  # resources :bookings, only: %i[]
  resources :bookings, only: %i[index show destroy]
end
