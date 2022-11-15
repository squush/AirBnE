Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # index show new create edit update destroy
  resources :crimes do

  end
end
