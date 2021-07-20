Rails.application.routes.draw do
  namespace :user do
    get 'users/show'
  end
  namespace :admin do
    devise_for :admins, controllers: {
      sessions:      'admin/admins/sessions',
      passwords:     'admin/admins/passwords',
      registrations: 'admin/admins/registrations'
    }
    resources :genres, only: [:index, :create, :edit, :update, :destroy]      #ジャンル
  end

  namespace :user do
    devise_for :users, controllers: {
      sessions: 'user/users/sessions',
      registrations: 'user/users/registrations',
      passwords: 'user/users/passwords'
    }
    resources :games do
      resources :game_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resources :users, only: [:index, :show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
  end
  root to: 'homes#top'
  get  "home/about" => 'homes#about'
end

