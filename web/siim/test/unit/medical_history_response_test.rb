require 'test_helper'

class MedicalHistoryResponseTest < ActiveSupport::TestCase
	# -------------------------------------------------------------------------
	# Test Methods...
	# -------------------------------------------------------------------------
	test "to json nil wrapper medical history" do 
		# Prepare...
		target = MedicalHistoryResponse.new

		# Perform...
		response = target.to_json

		# Assert...
		assert_not_found_on response
	end

	test "to json not nil wrapped medical history" do
		# Prepare...
		medical_history = new_medical_history_with "29042902","Adrian Norberto", "Marino"
		target = MedicalHistoryResponse.new medical_history

		# Perform...
		response = target.to_json

		# Assert...
		assert_found_on response
		assert_has_medical_history response, medical_history
	end

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def assert_found_on(a_response)
		assert_response_has_message_with a_response, MedicalHistoryResponse::FOUND
	end

	def assert_not_found_on(a_response)
		assert_response_has_message_with a_response, MedicalHistoryResponse::NOT_FOUND
	end

	def assert_response_has_message_with(a_response, a_value)
		assert_equal a_value, a_response[:response]
	end

	def assert_has_medical_history(a_response, a_medical_history)
		assert_equal a_medical_history.patient.dni, a_response[:patient]['dni']
		assert_equal a_medical_history.patient.firstname,  a_response[:patient]['firstname']
		assert_equal a_medical_history.patient.lastname, a_response[:patient]['lastname']
	end

	def new_medical_history_with(a_dni, a_firstname, a_lastname)
		medical_history = MedicalHistory.new
		medical_history.initialize_with_associations
		medical_history.patient.dni = a_dni
		medical_history.patient.firstname = a_firstname
		medical_history.patient.lastname = a_lastname
		return medical_history
	end
end
