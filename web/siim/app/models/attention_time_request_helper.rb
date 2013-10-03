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
		@params[:state]
	end

	def from_param
		log_from_param
		@params[:from].nil? ? nil : @params[:from].to_date
	end

	def to_param
		log_to_param
		@params[:to].nil? ? nil : @params[:to].to_date
	end

	def attention_time_param
		log_attention_time_param
		@params[:attention_time].nil? ? nil : AttentionTime.find_by_id(@params[:attention_time].to_i)
	end

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def log_attention_time_param
		log_param "Attention Time" ,@params[:attention_time]
	end

	def log_from_param
		log_param "From" ,@params[:from]
	end

	def log_to_param
		log_param "To" ,@params[:to]
	end

	def log_patient_param
		log_param "Patient" ,@params[:patient]
	end

	def log_medical_param
		log_param "Medical" ,@params[:medical]
	end

	def log_specialization_param
		log_param "Specialization" ,@params[:specialization]
	end

	def log_param(a_name,a_value)
		@logger.info "#{a_name} Param: #{a_value}"
	end
	# -------------------------------------------------------------------------
	# Initialize...
	# -------------------------------------------------------------------------
	def initialize(params, logger)
		@params = params
		@logger = logger
	end
end