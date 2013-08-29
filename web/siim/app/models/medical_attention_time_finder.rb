class MedicalAttentionTimeFinder
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def find_available_by(a_specialization)
		@times.select do |a_time| a_time.is_available_and_has? a_specialization end
	end

	# -------------------------------------------------------------------------
	# Initialize...
	# -------------------------------------------------------------------------
	def initialize(a_times)
		@times = a_times
	end

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	def available_and_has?(attention_times)
		attention_times.all? do |a_attention_time| a_attention_time.is_available? and a_attention_time.medical.medical_specialization <=> a_medical_specialization end
	end
end