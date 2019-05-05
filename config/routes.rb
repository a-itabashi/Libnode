Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener"

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope  :user do
    delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  resources :users, only: %i[show edit update], controller: 'users/users'
  get 'users/:id/upvotes', to: 'users/users#upvotes'
  get 'users/:id/borrowed_books', to: 'users/users#borrowed_books'

  resources :books, only: %i[index show] do
    resources :upvotes, only: %i[create destroy], shallow: true
  end

  resources :categories, only: %i[index]

  resources :borrow_lists, only: %i[create]

  resources :rankings, only: %i[index]

  namespace :admin do
    resources :registrations
    resources :users, only: %i[index destroy]
    post '/become_admin_user/:id', to: 'users#become_admin_user'
    post '/become_normal_user/:id', to: 'users#become_normal_user'
    resources :csv, only: %i[new create], controller: 'import_csvs'
    resources :books, only: %i[update destroy]
    get 'books/edit', to: 'books#edit'
    get 'fetch_books', to: 'fetch_books#search'
  end

  delete 'borrow_list/delete', to: 'borrow_lists#destroy'

  root to: 'books#index'
end
