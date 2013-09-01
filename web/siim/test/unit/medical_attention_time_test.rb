require 'test_helper'

class MedicalAttentionTimeTest < ActiveSupport::TestCase
	include Assertions
	# -------------------------------------------------------------------------
	# Test Methods...
	# -------------------------------------------------------------------------
	def test_find_by_specialization
		# Prepare...
		time = FactoryGirl.build :medical_attention_time, :available_clinic
		time.save

		# Perform...
		attention_times = MedicalAttentionTime.find specialization: time.medical.medical_specialization

		# Assert...
		assert_not_empty_collection attention_times
		assert_equal time, attention_times.first
	end
end