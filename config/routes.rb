Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :books, only: %i[index show]

  namespace :admin do
    resources :registrations, only: %i[new edit create]
  end
end
