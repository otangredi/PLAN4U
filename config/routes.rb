Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  root to: "pages#home"
  resources :events do
    resources :guests
    resources :guest_tables, only: %i[index new]
  end
  resources :guests, only: %i[edit update destroy]
  resources :guest_tables, only: %i[edit update destroy]
  post '/events/:event_id/guest_tables', to: "guest_tables#create", as: :create_table
end
