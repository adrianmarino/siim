class MedicalHistoriesController < CrudController
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	# GET /medical_histories/search_by_dni?query="a DNI"
	def search_by_dni
		medical_history = MedicalHistory.find_by_dni dni_param
		response = new_medical_history_response medical_history
		render json: response.to_json
	end

	def search
		render search_medical_histories_path
	end

	def perform_search
		@text = params[:text]
		@medical_histories = MedicalHistory.search text
		search
	end

	def custom_search
		render custom_search_medical_histories_path
	end

	def perform_custom_search
		@text = params[:text]
		@results= MedicalHistory.custom_search @text
		custom_search
	end

	# -------------------------------------------------------------------------
	# CRUD Methods...
	# -------------------------------------------------------------------------
	# GET /medical_histories
	# GET /medical_histories.json
	def index
		@medical_histories = MedicalHistory.all
		hide_view_action
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

		respond_to do |format|
			format.html # show.html.erb
			format.json { render json: @medical_history }
		end
	end

	# GET /medical_histories/new
	# GET /medical_histories/new.json
	def new
		@medical_history = MedicalHistory.new
		@medical_history.initialize_with_associations
		@medicals = Medical.all.sort

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
	end

	# POST /medical_histories
	# POST /medical_histories.json
	def create
		@medical_history = MedicalHistory.new(params[:medical_history])
		@medicals = Medical.all.sort
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
	def dni_param
		dni = params[:query]
	end

	def new_medical_history_response(a_medical_history)
		MedicalHistoryResponse.new a_medical_history
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
