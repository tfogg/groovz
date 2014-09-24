Groovz::Application.routes.draw do
  



  devise_for :users

  devise_scope :user do
    get 'register', to: 'devise/registrations#new', as: :register
    get 'login', to: 'devise/sessions#new', as: :login
    get 'logout', to: 'devise/sessions#destroy', as: :logout

  end

  resources :pictures

  resources :albums

  


  resources :bids, controller: 'bids'
  resources :shows, controller: 'shows'

  resources :users, controller: 'users'

  resources :statuses, controller: 'statuses'

   resources :users do
    member do
      get :following, :followers
    end
  end

scope ":profile_name" do
  resources :albums do
    resources :pictures
  end
end

 

  resources :relationships, :only => [:create, :destroy]


  

  get 'artists', to: 'users#artists', as: :artists
  get 'venues', to: 'users#venues', as: :venues
  get 'global', to: 'users#index', as: :global
  get 'music', to: 'users#music', as: :music
  get 'videos', to: 'users#videos', as: :videos
  get 'followers', to: 'users#show_follow', as: :followers
  get 'about', to: 'users#about', as: :about
  get '/:id/setup', to: 'users#setup', as: :setup
  get '/:id/feed', to: 'users#feed', as: :feed
  get '/:id/shows', to: 'users#shows', as: :usershows
  root to: 'pages#home'

  get 'home', to: 'pages#home', as: :home

  get '/:id', to: 'users#show', as: :profile







end
