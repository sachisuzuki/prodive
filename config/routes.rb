Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: 'users/registrations', sessions: 'users/sessions' }
  root to: 'home#top'
  resources :users do
    member do
      get 'mypage', to: 'users#show', as: :mypage
    end
  end

end
