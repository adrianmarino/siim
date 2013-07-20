class MedicalHistoryResponse
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def to_json
		@medical_history.nil? ? not_found_response : append_found_response_to(@medical_history)
	end


	# ----------------------------------------------------------------------------
	# Constants
	# ----------------------------------------------------------------------------
	FOUND = "found"
	NOT_FOUND = "not found"

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def not_found_response
		{ :response => NOT_FOUND }
	end

	def found_response
		{ :response => FOUND }
	end

	def append_found_response_to(a_medical_history)
		found_response.merge a_medical_history.as_json
	end

	# -------------------------------------------------------------------------
	# Initialize...
	# -------------------------------------------------------------------------
	def initialize(a_medical_history = nil)
		@medical_history = a_medical_history
	end
end