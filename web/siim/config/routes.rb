Siim::Application.routes.draw do
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

  resources :medicals
  resources :medical_specializations
  resources :medical_histories do
    get :search_by_dni, on: :collection
  end

  get '/attention_times/setup_search', to: 'attention_time#setup_search'
  post '/attention_times/search', to: 'attention_time#search'
  get '/attention_times/daily_attention_times', to: 'attention_time#daily_attention_times'
end
