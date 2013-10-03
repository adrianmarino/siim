class AttentionTimeController  < ApplicationController
	# -------------------------------------------------------------------------
	# Public Request Methods...
	# -------------------------------------------------------------------------
	def setup_search
		prepare_form
		render attention_times_setup_search_path
	end

	def search
		prepare_form
		helper = request_helper

		@attention_times = AttentionTime.find specialization: helper.specialization_param,
																					medical: helper.medical_param,
																					patient: helper.patient_param,
																					state: helper.state_param,
																					from: helper.from_param,
																					to: helper.to_param
		render attention_times_setup_search_path
	end

	def liberate
		attention_time = request_helper.attention_time_param
		if not attention_time.nil?
			attention_time.liberate!
			attention_time.save
		end
		redirect_to attention_times_setup_search_path
	end

	def reserve
		attention_time = request_helper.attention_time_param
		if not attention_time.nil?
			attention_time.reserve!
			attention_time.patient = request_helper.patient_param
			attention_time.save
		end
		redirect_to attention_times_setup_search_path
	end

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def to_date
		last_time = AttentionTime.last
		last_time.nil? ? Date.today : last_time.to_date
	end

	def prepare_form
		@specializations = MedicalSpecialization.all.sort
		@medicals = Medical.all
		@patients = Patient.all
		@states = AttentionTime.all_states
		@from = Date.today
		@to = to_date
	end

	def request_helper
		AttentionTimeRequestHelper.new params, logger
	end
end