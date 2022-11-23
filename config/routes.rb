Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  root to: "pages#home"
  resources :events do
    resources :guests
  end
end
