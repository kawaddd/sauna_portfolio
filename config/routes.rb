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
    get 'about', to: 'homes#about'
    resources :saunas
    resources :users
    namespace	 :users do
      get 'reviewed_saunas/index'
    end
    namespace	 :users do
      get 'hozon_saunas/index'
    end
    namespace	 :users do
      get 'visited_saunas/index'
    end
    resources :reviews
  end

end