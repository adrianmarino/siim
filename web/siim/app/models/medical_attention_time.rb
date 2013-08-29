class MedicalAttentionTime
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def is_available?
		state.kind_of? AvailableMedicalAttentionTime
	end

	def is_reserved?
		state.kind_of? ReservedMedicalAttentionTime
	end

	def is_available_and_has?(a_specialization)
	 self.is_available? and self.medical.medical_specialization <=> a_specialization 
	end

	# -------------------------------------------------------------------------
	# Initialize...
	# -------------------------------------------------------------------------
	def initialize(a_state = AvailableMedicalAttentionTime.new)
		@state = a_state
	end

	# -------------------------------------------------------------------------
	# Attributes...
	# -------------------------------------------------------------------------
	attr_accessor :medical, :state
end