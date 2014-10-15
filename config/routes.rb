Rails.application.routes.draw do
  # Active Admin Routes
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Point the web site root to the index page
  root :to => 'pages#index'

  get '/pages/index' => 'pages#index'
  get '/pages/services' => 'pages#services'
  get '/pages/about' => 'pages#about'
  get '/pages/portfolio' => 'pages#portfolio'
  get '/pages/contact' => 'pages#contact'
  get '/pages/start_a_project' => 'pages#start_a_project'

  post '/pages/start_a_project', to: 'pages#create'
  get '/pages/start_a_project_landing_page', to: 'pages#start_a_project_landing_page'

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

  # Automatically match all out routes
  # match ':controller(/:action(/:id))', :via => :get
  # match ':controller(/:action(/:id))', :via => :post
end
