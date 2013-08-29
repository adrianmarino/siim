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

	# -------------------------------------------------------------------------
	# Initialize...
	# -------------------------------------------------------------------------
	def initialize(a_state = AvailableMedicalAttentionTime.new)
		@state = a_state
	end

	# -------------------------------------------------------------------------
	# Attributes...
	# -------------------------------------------------------------------------
	attr_accessor :medical_specialization, :state
end