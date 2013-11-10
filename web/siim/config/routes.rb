Siim::Application.routes.draw do
	mount Core::Engine, at: "/core"
	devise_for :users, :path => "",
		:path_names => {
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

	root :to => "home#index"

	resources :users do
		get :send_password,											on: :collection
	end

	resources :medicals
	resources :medical_specializations

	resources :medical_histories do
		get		:search_by_dni,											on: :collection
		get		:search_by_patient,									on: :collection
		post	:perform_search,										on: :collection
		get		:custom_search,											on: :collection
		post	:perform_custom_search,							on: :collection
		get		:show_custom_search_result_detail,	on: :collection
		post	:search_patient_by_dni,							on: :collection
		post	:search_patient_by_name,						on: :collection
	end

	get		'/assets/javascripts/dinamic_medicals',				to: 'javascripts#dinamic_medicals'

	get		'/appointments/setup_search',									to: 'appointment#setup_search'
	post	'/appointments/liberate',											to: 'appointment#liberate'
	post	'/appointments/reserve',											to: 'appointment#reserve'
	get		'/appointments/attend',												to: 'appointment#attend'
	get		'/appointments/finalize',											to: 'appointment#finalize'
	post	'/appointments/search',												to: 'appointment#search'
	get		'/appointments/my_appointments',							to: 'appointment#my_appointments'
	get		'/appointments/edit_related_medical_history',	to: 'appointment#edit_related_medical_history'

	get		'/statistics/setup_simptom',									to: 'statistic#setup_simptom'
	post	'/statistics/perform_simptom',								to: 'statistic#perform_simptom'
	get		'/statistics/setup_disease',									to: 'statistic#setup_disease'
	post	'/statistics/perform_disease',								to: 'statistic#perform_disease'

	get		'/log/download',															to: 'log#download'

	get		'search_engine/administrate',									to: 'search_engine#administrate'
	get		'search_engine/query_debug',									to: 'search_engine#query_debug'
	get		'search_engine/statistics',										to: 'search_engine#statistics'
end
