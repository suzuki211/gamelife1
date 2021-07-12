Rails.application.routes.draw do
  namespace :admin do
    devise_for :admins, controllers: {
      sessions:      'admin/admins/sessions',
      passwords:     'admin/admins/passwords',
      registrations: 'admin/admins/registrations'
    }
  end

  namespace :user do
    devise_for :users, controllers: {
      sessions: 'user/users/sessions',
      registrations: 'user/users/registrations',
      passwords: 'user/users/passwords'
    }
    resources :games do
      resources :game_comments, only: [:create, :destroy]
    end
  end
  root to: 'homes#top'
end