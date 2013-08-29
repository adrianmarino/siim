class MedicalAttentionTimeFinder
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def find_available_by(a_specialization)
		@times.select do |a_time| a_time.is_available? end
	end

	# -------------------------------------------------------------------------
	# Initialize...
	# -------------------------------------------------------------------------
	def initialize(a_times)
		@times = a_times
	end
end