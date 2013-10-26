class MedicalHistorySearchResult
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def to_s
		@text
	end

	# -------------------------------------------------------------------------
	# Attributes...
	# -------------------------------------------------------------------------
	attr_reader :medical_history

	# -------------------------------------------------------------------------
	# Initialize...
	# -------------------------------------------------------------------------
	def initialize(a_medical_history, indexes)
		@medical_history = a_medical_history
		@text = MedicalHistoryStringResultBuilder.new(a_medical_history, indexes).with_all.to_s
	end
end