Rails.application.routes.draw do
  namespace :admin do
    devise_for :admins, controllers: {
      sessions:      'admin/admins/sessions',
      passwords:     'admin/admins/passwords',
      registrations: 'admin/admins/registrations'
    }
    resources :games, only: [:new, :create, :index, :show, :edit, :destroy, :update] do
      resources :game_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resources :genres, only: [:index, :create, :edit, :update, :destroy]      #ジャンル
    resources :users, only: [:index, :show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    get "search" => "searches#search"
  end

  namespace :user do
    devise_for :users, controllers: {
      sessions: 'user/users/sessions',
      registrations: 'user/users/registrations',
      passwords: 'user/users/passwords'
    }
    resources :games, only: [:new, :create, :index, :show, :edit, :destroy, :update] do
      resources :game_comments, only: [:create, :destroy]
      resources :tags, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resources :users, only: [:index, :show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    get "search" => "searches#search"
  end
  root to: 'homes#top'
  get  "home/about" => 'homes#about'
end

