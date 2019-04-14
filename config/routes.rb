Rails.application.routes.draw do
  devise_for :users
  resources :books, only: %i[index show]

  namespace :admin do
    resources :registrations, only: %i[new edit create]
  end
end
