Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope  :user do
    delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  resources :books, only: %i[index show]

  namespace :admin do
    resources :registrations, only: %i[new edit create]
  end

  root to: 'admin/registrations#new'
end
