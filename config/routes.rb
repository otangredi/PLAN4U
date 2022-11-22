Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  root to: "pages#home"
  resources :events do
    resources :guests, only: %i[index new create]
  end
  resources :guests, only: %i[edit update destroy]
end
