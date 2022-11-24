Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  unauthenticated :user do
    root 'pages#home', as: :unauthenticated_root
  end
  authenticated :user do
    root to: 'events#index', as: :authenticated_root
  end
  resources :events do
    resources :guests
    resources :guest_tables, only: %i[index new]
  end
  resources :guests, only: %i[edit update destroy]
  resources :guest_tables, only: %i[edit update destroy]
  post '/events/:event_id/guest_tables', to: "guest_tables#create", as: :create_table
  get '/guestlist', to: 'guests#import_guests_from_file', as: :guestlist
end
