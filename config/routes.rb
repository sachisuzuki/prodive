Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  root to: 'home#top'
  resources :users do
    member do
      get 'mypage', to: 'users#show', as: :mypage
    end
  end
  resources :divesites, only: %i[ index show ] do
    collection do
      get 'select_map'
    end
  end
  resources :conditions, only: %i[ index show new create destroy ]
end
