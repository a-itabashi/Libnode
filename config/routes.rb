Rails.application.routes.draw do
  resources :books, only: %i[index show]

  namespace :admin do
    resources :books, only: %i[new edit create update destroy]
  end
end
