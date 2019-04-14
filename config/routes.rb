Rails.application.routes.draw do
  resources :books, only: %i[index show]

  namespace :admin do
    resources :registrations, only: %i[new edit create]
  end
end
