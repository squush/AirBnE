Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :crimes, only: %i[index new create show delete] do
    # TODO: Remove the new here. Just make the booking via a form directly on
    #       the crime's show page. This will require changes downstream.
    resources :bookings, only: %i[new create]
  end

  get '/my_crimes', to: 'crimes#my_crimes'
  get '/profile', to: 'users#profile'

  get '/approve/:id', to: "bookings#approve", as: :approve_booking
  get '/reject/:id', to: "bookings#reject", as: :reject_booking

  resources :bookings, only: %i[index show destroy]
end
