Groovz::Application.routes.draw do
  



  devise_for :users

  devise_scope :user do
    get 'register', to: 'devise/registrations#new', as: :register
    get 'login', to: 'devise/sessions#new', as: :login
    get 'logout', to: 'devise/sessions#destroy', as: :logout

  end

  resources :statuses, controller: 'statuses'
  

  get 'artists', to: 'pages#artists', as: :artists
  get 'global', to: 'users#index', as: :global
  get 'music', to: 'users#music', as: :music
  get 'pictures', to: 'users#pictures', as: :pictures
  get 'videos', to: 'users#videos', as: :videos
  get 'followers', to: 'users#show_follow', as: :followers
  get 'about', to: 'users#about', as: :about
  get 'setup/:id', to: 'users#setup', as: :setup
  root to: 'pages#home'

  get 'home', to: 'pages#home', as: :home

  get '/:id', to: 'users#show', as: :profile




  resources :shows, controller: 'shows'

  get '/:id', to: 'shows#show', as: :gig

  get 'bid', to: 'shows#bid', as: :bid

  get 'new', to: 'shows#new', as: :new

  

  

  resources :users do
    member do
      get :following, :followers
    end
  end

 

  resources :relationships, :only => [:create, :destroy]


 




  




  


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

end
