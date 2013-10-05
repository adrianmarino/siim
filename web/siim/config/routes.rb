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
  }, :controllers => { :sessions => "sessions" }

  resources :users
  resources :medicals
  resources :medical_specializations
  resources :medical_histories do
    get :search_by_dni, on: :collection
  end

  get '/assets/javascripts/dinamic_medicals', to: 'javascripts#dinamic_medicals'
  get '/attention_times/setup_search', to: 'attention_time#setup_search'
  post '/attention_times/liberate', to: 'attention_time#liberate'
  post '/attention_times/reserve', to: 'attention_time#reserve'

  post '/attention_times/search', to: 'attention_time#search'
  get '/attention_times/daily_attention_times', to: 'attention_time#daily_attention_times'

  get '/statistics/setup_simptom', to: 'statistic#setup_simptom'
  post '/statistics/perform_simptom', to: 'statistic#perform_simptom'

  get '/statistics/setup_disease', to: 'statistic#setup_disease'
  post '/statistics/perform_disease', to: 'statistic#perform_disease'
end
