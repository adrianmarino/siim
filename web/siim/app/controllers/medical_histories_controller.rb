class MedicalHistoriesController < CrudController
	load_and_authorize_resource :except => [
		:search_by_dni,
		:search_by_patient,
		:search_patient_by_dni,
		:search_patient_by_name,
		:custom_search,
		:perform_custom_search
	]

	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	# Andriod search...
	# GET /medical_histories/search_by_dni?query="a DNI"
	def search_by_dni
		authorize! :search_by_dni, :medical_history

		medical_history = MedicalHistory.find_by_dni(query_param).first
		response = new_medical_history_response medical_history
		render json: response.to_json
	end

	# Search by patient...
	def search_by_patient
		authorize! :search_by_patient, :medical_history
		render search_by_patient_medical_histories_path
	end

	def search_patient_by_dni
		authorize! :search_by_patient, :medical_history
		@medical_histories = MedicalHistory.find_by_dni(dni_param) unless dni_param.length <=2
		select_search_by_dni_tab
		search_by_patient
	end

	def search_patient_by_name
		authorize! :search_by_patient, :medical_history
		@medical_histories = MedicalHistory.find_by_firname_and_lastname(firstname_param, lastname_param) unless firstname_param.length <=2 and lastname_param.length <=2
		select_search_by_name_tab
		search_by_patient
	end

	# Custom Search...
	def custom_search
		authorize! :custom_search, :medical_history
		render custom_search_medical_histories_path
	end

	def perform_custom_search
		authorize! :custom_search, :medical_history
		@text = params[:text]
		@results= MedicalHistorySearchEngine.search @text
		custom_search
	end

	# -------------------------------------------------------------------------
	# CRUD Methods...
	# -------------------------------------------------------------------------
	# GET /medical_histories
	# GET /medical_histories.json
	def index
		@medical_histories = MedicalHistory.all
		hide_remove_action

		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @medical_histories }
		end
	end

	# GET /medical_histories/1
	# GET /medical_histories/1.json
	def show
		@medical_history = MedicalHistory.find(params[:id])
		@back_url = params[:back_url].nil? ? medical_histories_path : params[:back_url]

		respond_to do |format|
			format.html # show.html.erb
			format.json { render json: @medical_history }
		end
	end

	def show_custom_search_result_detail
		@medical_history = MedicalHistory.find(params[:id])
		render show_custom_search_result_detail_medical_histories_path
	end

	# GET /medical_histories/new
	# GET /medical_histories/new.json
	def new
		@medical_history = MedicalHistory.new
		@medical_history.initialize_with_associations
		@medicals = Medical.all.sort
		@back_url = medical_histories_path

		@allergies_count			= 0
		@antecedents_count		= 0
		@consultations_count	= 0
		@diseases_count				= 0
		@medical_exams_count	= 0
		@medications_count		= 0
		@vaccines_count				= 0

		respond_to do |format|
			format.html # new.html.erb
			format.json { render json: @medical_history }
		end
	end

	# GET /medical_histories/1/edit
	def edit
		@medical_history = MedicalHistory.find(params[:id])
		@medicals = Medical.all.sort
		@back_url = params[:back_url].nil? ? medical_histories_path : params[:back_url]

		@allergies_count			= @medical_history.allergies.size
		@antecedents_count		= @medical_history.antecedents.size
		@consultations_count	= @medical_history.consultations.size
		@diseases_count				= @medical_history.diseases.size
		@medical_exams_count	= @medical_history.medical_exams.size
		@medications_count		= @medical_history.medications.size
		@vaccines_count				= @medical_history.vaccines.size
	end

	# POST /medical_histories
	# POST /medical_histories.json
	def create
		@medical_history = MedicalHistory.new(params[:medical_history])
		@medicals = Medical.all.sort
		@back_url = params[:back_url].nil? ? medical_histories_path : params[:back_url]

		@allergies_count			= @medical_history.id.nil? ? 0 : @medical_history.allergies.size
		@antecedents_count		= @medical_history.id.nil? ? 0 : @medical_history.antecedents.size
		@consultations_count	= @medical_history.id.nil? ? 0 : @medical_history.consultations.size
		@diseases_count				= @medical_history.id.nil? ? 0 : @medical_history.diseases.size
		@medical_exams_count	= @medical_history.id.nil? ? 0 : @medical_history.medical_exams.size
		@medications_count		= @medical_history.id.nil? ? 0 : @medical_history.medications.size
		@vaccines_count				= @medical_history.id.nil? ? 0 : @medical_history.vaccines.size

		respond_to do |format|
			if @medical_history.save
				format.html { redirect_to medical_histories_path, notice: CrudTranslations.model_was_created(@medical_history) }
				format.json { render json: @medical_history, status: :created, location: @medical_history }
			else
				format.html { render action: "new" }
				format.json { render json: @medical_history.errors, status: :unprocessable_entity }
			end
		end
	end

	# PUT /medical_histories/1
	# PUT /medical_histories/1.json
	def update
		@medical_history = MedicalHistory.find(params[:id])
		@medicals = Medical.all.sort
		@back_url = params[:back_url].nil? ? medical_histories_path : params[:back_url]

		@allergies_count			= @medical_history.allergies.size
		@antecedents_count		=	@medical_history.antecedents.size
		@consultations_count	= @medical_history.consultations.size
		@diseases_count				= @medical_history.diseases.size
		@medical_exams_count	= @medical_history.medical_exams.size
		@medications_count		= @medical_history.medications.size
		@vaccines_count				= @medical_history.vaccines.size

		respond_to do |format|
			if @medical_history.update_attributes(params[:medical_history])
				format.html { redirect_to @back_url, notice: CrudTranslations.model_was_updated(@medical_history) }
				format.json { head :no_content }
			else
				format.html { render action: "edit" }
				format.json { render json: @medical_history.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /medical_histories/1
	# DELETE /medical_histories/1.json
	def destroy
		@medical_history = MedicalHistory.find(params[:id])
		@medical_history.destroy

		respond_to do |format|
			format.html { redirect_to medical_histories_url }
			format.json { head :no_content }
		end
	end

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def query_param
		params[:query]
	end

	def dni_param
		params[:dni]
	end

	def firstname_param
		params[:first_name]
	end

	def lastname_param
		params[:last_name]
	end

	def new_medical_history_response(a_medical_history)
		MedicalHistoryResponse.new a_medical_history
	end

	def select_search_by_dni_tab
		@selected_tab= 'dni-panel'
	end

	def select_search_by_name_tab
		@selected_tab= 'name-panel'
	end

	# -------------------------------------------------------------------------
	# Constructor...
	# -------------------------------------------------------------------------
	def initialize
		super
		@entity_name = 'medical_history'
		@plural_entity_name = 'medical_histories'
	end
end
