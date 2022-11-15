Rails.application.routes.draw do
  devise_for :users do
    # No new route for bookings. We'll just have the form directly on the crime
    # page so the user can book without going to a new page
    resources :bookings, only: %i[index show create]
  end
  root to: "pages#home"

  # index show new create edit update destroy
  resources :crimes do
  end

  get '/my_crimes', to: 'crimes#my_crimes'

  resources :bookings, only: %i[destroy]
end
