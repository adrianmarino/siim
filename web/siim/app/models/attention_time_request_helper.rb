class AttentionTimeRequestHelper
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def specialization_param
		log_specialization_param
		@params[:specialization] == "all" ? nil : MedicalSpecialization.find(@params[:specialization])
	end

	def medical_param
		log_medical_param
		@params[:medical] == "all" ? nil : Medical.find(@params[:medical])
	end

	def patient_param
		log_patient_param
		@params[:patient] == "all" ? nil : Patient.find(@params[:patient])
	end

	def state_param
		@param[:state]
	end

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def log_patient_param
		@logger.info "Patient Param: #{@params[:patient]}"
	end

	def log_medical_param
		@logger.info "Medical Param: #{@params[:medical]}"
	end

	def log_specialization_param
		@logger.info "Specialization Param: #{@params[:specialization]}"
	end

	# -------------------------------------------------------------------------
	# Initialize...
	# -------------------------------------------------------------------------
	def initialize(params, logger)
		@params = params
		@logger = logger
	end
end