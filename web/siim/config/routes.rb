Siim::Application.routes.draw do
  get "manager_users/index"

  mount Core::Engine, at: "/core"

  root :to => "home#index"

  devise_for :users, :path => "", :path_names => {
    :sign_in => 'login',
    :sign_out => 'logout',
    :password => 'secret',
    :confirmation => 'verification',
    :unlock => 'unblock',
    :registration => 'register',
    :sign_up => 'cmon_let_me_in',
    :users => 'users'
  }, 
  :controllers => { :sessions => "sessions" }

  devise_for :users, :skip => [:registrations]
    as :user do
      get 'users/edit' => 'devise/registrations#edit', :as => '/register/edit'
      put 'users/:id' => 'devise/registrations#update', :as => 'user_registration'
  end

  resources :users
  resources :medicals
  resources :medical_specializations
  resources :medical_histories do
    get :search_by_dni, on: :collection
  end

  get '/assets/javascripts/dinamic_medicals', to: 'javascripts#dinamic_medicals'
  get '/appointments/setup_search', to: 'appointment#setup_search'
  post '/appointments/liberate', to: 'appointment#liberate'
  post '/appointments/reserve', to: 'appointment#reserve'
  post '/appointments/search', to: 'appointment#search'
  get '/appointments/my_appointments', to: 'appointment#my_appointments'

  get '/statistics/setup_simptom', to: 'statistic#setup_simptom'
  post '/statistics/perform_simptom', to: 'statistic#perform_simptom'

  get '/statistics/setup_disease', to: 'statistic#setup_disease'
  post '/statistics/perform_disease', to: 'statistic#perform_disease'
end
