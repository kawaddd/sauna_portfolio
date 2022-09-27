Rails.application.routes.draw do

  devise_for :admin,skip: [:registrations, :passwords],controllers: {
    sessions: "admin/sessions"
  }

  devise_for :users,skip: [:passwords],controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  namespace :admin do
    root to: 'homes#top'
    resources :saunas
    resources :users
    resources :reviews
  end

  scope module: :public do
    root to: 'homes#top'
    get :about, to: 'homes#about'
    resources :saunas do
      resources :reviews
        resource :likes, only: [:create, :destroy]
      resource :bookmarks, only: [:create, :destroy]
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