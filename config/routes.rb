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
  end
end
