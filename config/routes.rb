Rails.application.routes.draw do
  # Active Admin Routes
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Point the web site root to the index page
  root to: 'pages#index'

  # Pages routes
  get '/pages/index' => 'pages#index'
  get '/pages/services' => 'pages#services'
  get '/pages/about' => 'pages#about'
  get '/pages/get_recommendations' => 'pages#get_recommendations'
  get '/pages/portfolio' => 'pages#portfolio'
  get '/pages/contact' => 'pages#contact'
  get '/pages/start_a_project' => 'pages#start_a_project'
  post '/pages/start_a_project', to: 'pages#create'
  get '/pages/start_a_project_landing_page', to: 'pages#start_a_project_landing_page'
end
