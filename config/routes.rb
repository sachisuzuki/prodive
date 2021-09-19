Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/guest_admin_sign_in', to: 'users/sessions#guest_admin_sign_in'
  end
  root to: 'home#top'

  resources :users, only: %i[ show ] do
    member do
      get 'mypage'
      get 'myprofile'
      get 'myfavorite'
      get 'mypost'
    end
  end
  resources :divesites, only: %i[ index show ] do
    collection do
      get 'select_map'
    end
  end
  resources :conditions, only: %i[ index show new create destroy ]
  resources :favorites, only: %i[ create destroy ]
  resources :relationships, only: %i[ ] do
    collection do
      post 'follow', to: 'relationships#create', as: :follow
    end
    member do
      delete 'unfollow', to: 'relationships#destroy', as: :unfollow
    end
  end
end
