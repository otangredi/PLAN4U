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
    resources :e_vites, only: %i[index new]
  end
  resources :guests, only: %i[edit update destroy]
  resources :guest_tables, only: %i[edit update destroy]
  resources :e_vites, only: %i[edit update destroy]
  resources :guest_choices, only: %i[ index show ]
  post '/events/:event_id/guest_tables', to: "guest_tables#create", as: :create_table
  post '/events/:event_id/e_vites', to: "e_vites#create", as: :create_e_vite
  get '/guestlist', to: 'guests#import_guests_from_file', as: :guestlist
  patch '/guest_choices/:id/:status/attendance', to: "guest_choices#attendance", as: :attendance
end
