Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  root to: 'pages#home'
  resources :events do
    resources :guests
    resources :guest_tables
    resources :e_vites, only: %i[index new update]
  end
  resources :guests, only: %i[edit update destroy] do
    resources :guest_choices
  end
  resources :e_vites, only: %i[edit update destroy]
  post '/events/:event_id/guest_tables', to: "guest_tables#create", as: :create_table
  post '/events/:event_id/e_vites', to: "e_vites#create", as: :create_e_vite
  post '/guestlist', to: 'guests#import_guests_from_file', as: :guestlist
  get '/events/:event_id/find_rsvp', to: 'guest_choices#find_rsvp', as: :find_rsvp
  get '/events/:event_id/rsvp', to: 'guest_choices#rsvp_home', as: :rsvp_home
  patch '/guest_choices/:id/:status/attendance', to: "guest_choices#attendance", as: :attendance
  get '/events/:event_id/send_all_evite', to: "guests#send_all_evite", as: :send_all_evite
  get '/events/:event_id/:id/send_one_evite', to: "guests#send_one_evite", as: :send_one_evite
  post '/checklist', to: 'events#change_value', as: :checklist
end
