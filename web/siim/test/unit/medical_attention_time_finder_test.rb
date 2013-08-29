require 'test_helper'

class MedicalAttentionTimeFinderTest < ActiveSupport::TestCase
	# -------------------------------------------------------------------------
	# Test Methods...
	# -------------------------------------------------------------------------
	def test_find_available_by_specialization
		# Prepare...
		times = [new_available_clinic_attention_time, new_reserved_pediatricion_attention_time]
		finder = MedicalAttentionTimeFinder.new(times)
		specialization = new_available_clinic_attention_time

		# Perform...
		attention_times = finder.find_available_by specialization

		# Assert...
		assert !attention_times.empty?
		assert all_available_and_has_medical_specialization?(attention_times, specialization), "Some attention times not available"
	end

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def new_reserved_pediatricion_attention_time
		FactoryGirl.build :medical_attention_time, :reserved_pediatrician
	end

	def new_available_clinic_attention_time
		FactoryGirl.build :medical_attention_time, :available_clinic
	end

	def all_available_and_has_medical_specialization?(attention_times, a_medical_specialization)
		attention_times.all? do |a_attention_time| a_attention_time.is_available? and a_attention_time.medical.medical_specialization <=> a_medical_specialization end
	end
end
