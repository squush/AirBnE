Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # index show new create edit update destroy
  resources :crimes

  get '/my_crimes', to: 'crimes#my_crimes'
  resources :users, only: %i[show] do
    # No new route for bookings. We'll just have the form directly on the crime
    # page so the user can book without going to a new page
    # resources :bookings, only: %i[]

    # TODO: This nesting isn't needed
    resources :bookings, only: %i[index show create]
  end

  get '/approve/:id', to: "bookings#approve", as: :approve_booking
  get '/reject/:id', to: "bookings#reject", as: :reject_booking

  resources :bookings, only: %i[destroy]
end
