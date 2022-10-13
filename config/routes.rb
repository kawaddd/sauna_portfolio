Rails.application.routes.draw do

  devise_for :admin,skip: [:registrations, :passwords],controllers: {
    sessions: "admin/sessions"
  }

  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions',
    passwords: 'public/passwords'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end


  namespace :admin do
    root to: 'homes#top'
    resources :saunas
    resources :users
    resources :reviews
  end

  scope module: :public do
    root to: 'homes#top'
    get :about, to: 'homes#about'
    get "search" => "searches#search"
    get "tag" => "saunas#tag"
    resources :saunas do
      resources :reviews do
        resources :comments, only: [:create, :destroy] do
          resources :comment_likes, only: [:create, :destroy]
        end
      end
      resource :likes, only: [:create, :destroy]
      resource :bookmarks, only: [:create, :destroy]
      resource :visits, only: [:create, :destroy]
    end

    resources :users do
      get :reviewed_saunas
      get :hozon_saunas
      get :visited_saunas
      collection do
        get :unsubscribe
        patch :withdraw
      end
      get 'information/edit', to: 'users#edit', as: :edit_users
      patch :information, to: 'users#update', as: :update_users
    end
  end
end