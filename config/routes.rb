Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  root to: 'pages#home'
  resources :events do
    resources :guests
    resources :guest_tables
    resources :e_vites, only: %i[index new]
  end
  resources :guests, only: %i[edit update destroy] do
    resources :guest_choices
  end
  resources :e_vites, only: %i[edit update destroy]
  post '/events/:event_id/guest_tables', to: "guest_tables#create", as: :create_table
  post '/events/:event_id/e_vites', to: "e_vites#create", as: :create_e_vite
  get '/guestlist', to: 'guests#import_guests_from_file', as: :guestlist
  get '/rsvp', to: 'guest_choices#find_rsvp', as: :find_rsvp
  patch '/guest_choices/:id/:status/attendance', to: "guest_choices#attendance", as: :attendance
end
