module AttentionTimeRequestHelper
	def specialization_param
		return nil if params[:specialization] = "all"

		logger.debug "Specialization: {params[:specialization]}"

		specializations = MedicalSpecialization.find params[:specialization]
		specializations.empty? ? nil : specializations.first
	end

	def medical_param
		return nil if params[:medical] = "all"

		logger.debug "Medical: {params[:medical]}"

		medicals = Medical.find params[:medical]
		medicals.empty? ? nil : medicals.first
	end

	def patient_param
		return nil if params[:patient] = "all"

		logger.debug "Patient: {params[:patient]}"

		patients = Patient.find params[:patient]
		patients.empty? ? nil : patients.first
	end

	def state_param
		param[:state]
	end
end