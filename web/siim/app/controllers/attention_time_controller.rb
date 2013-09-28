class AttentionTimeController  < ApplicationController
	# -------------------------------------------------------------------------
	# Public Request Methods...
	# -------------------------------------------------------------------------
	def setup_search
		prepare_form
		render 'attention_times/setup_search'
	end

	def search
		prepare_form
		helper = AttentionTimeRequestHelper.new params, logger

		@attention_times = AttentionTime.find specialization: helper.specialization_param,
																					medical: helper.medical_param,
																					patient: helper.patient_param#,
																					#from: Date.today, to: to_date
		render 'attention_times/setup_search'
	end

	def daily_attention_times
		@attention_times = AttentionTimes.all
		render 'attention_times/daily_attention_times'
	end

	def attention_time_attended
		attenton_time.attend
		daily_attention_times
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
	end
end