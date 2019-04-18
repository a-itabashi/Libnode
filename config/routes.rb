Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope  :user do
    delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  resources :books, only: %i[index show] do
    resources :upvotes, only: %i(create destroy), shallow: true
  end

  resources :borrow_lists, only: %i[create destroy]

  namespace :admin do
    resources :registrations, only: %i[new edit create]
  end

  get 'book_collection_list', to: 'pages#book_collection_list'

  root to: 'pages#book_collection_list'
end
