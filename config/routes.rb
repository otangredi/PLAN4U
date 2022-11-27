Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  root to: 'pages#home'
  resources :events do
    resources :guests
    resources :guest_tables, only: %i[index new]
    resources :e_vites, only: %i[index new]
  end
  resources :guests, only: %i[edit update destroy] do
    resources :guest_choices
  end
  resources :guest_tables, only: %i[edit update destroy]
  resources :e_vites, only: %i[edit update destroy]
  # resources :guest_choices, only: %i[update]
  post '/events/:event_id/guest_tables', to: "guest_tables#create", as: :create_table
  post '/events/:event_id/e_vites', to: "e_vites#create", as: :create_e_vite
  get '/guestlist', to: 'guests#import_guests_from_file', as: :guestlist
  get '/rsvp', to: 'guest_choices#find_rsvp', as: :find_rsvp
  # get '/rsvp/:id', to: 'guest_choices#new', as: :new_guest_choice
  # post '/rsvp/:id', to: 'guest_choices#create'
  # get '/rsvp/:query/edit', to: 'guest_choices#edit', as: :edit_guest_choice
  # patch '/rsvp/:id', to: 'guest_choices#update'

  patch '/guest_choices/:id/:status/attendance', to: "guest_choices#attendance", as: :attendance
end
