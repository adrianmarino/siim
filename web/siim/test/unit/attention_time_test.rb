require 'test_helper'

class AttentionTimeTest #< ActiveSupport::TestCase
	include Assertions
	# -------------------------------------------------------------------------
	# Test Methods...
	# -------------------------------------------------------------------------
	def test_find_by_specialization
		# Prepare...
		FactoryGirl.build(:attention_time, :reserved_pediatrician_at_2013_09_22_10_00).save
		clinic_time = FactoryGirl.build :attention_time, :available_clinic_at_2013_09_22_09_00
		clinic_time.save

		# Perform...
		attention_times = AttentionTime.find specialization: clinic_time.medical.medical_specialization

		# Assert...
		assert attention_times.one?
		assert_equal clinic_time.medical.medical_specialization, attention_times.first.medical.medical_specialization
	end

	def test_find_by_medical
		# Prepare...
		FactoryGirl.build(:attention_time, :available_clinic_at_2013_09_22_09_00).save
		pediatrician_time = FactoryGirl.build :attention_time, :reserved_pediatrician_at_2013_09_22_10_00
		pediatrician_time.save

		# Perform...
		attention_times = AttentionTime.find medical: pediatrician_time.medical

		# Assert...
		assert attention_times.one?
		assert_equal pediatrician_time.medical, attention_times.first.medical
	end

	def test_find_by_patient
		# Prepare...
		FactoryGirl.build(:attention_time, :available_clinic_at_2013_09_22_09_00).save
		attention_time = FactoryGirl.build :attention_time, :reserved_pediatrician_at_2013_09_22_10_00
		attention_time.save

		# Perform...
		attention_times = AttentionTime.find patient: attention_time.patient

		# Assert...
		assert attention_times.one?
		assert_equal attention_time.patient, attention_times.first.patient
	end

	def test_find_by_state
		# Prepare...
		FactoryGirl.build(:attention_time, :reserved_clinic_at_2013_09_22_09_30).save
		FactoryGirl.build(:attention_time, :available_clinic_at_2013_09_22_09_00).save
		state = :available

		# Perform...
		attention_times = AttentionTime.find state: state

		# Assert...
		assert attention_times.one?
		assert_equal state, attention_times.first.current_state.name
	end

	def test_find_by_from_time
		# Prepare...
		FactoryGirl.build(:attention_time, :available_clinic_at_2013_09_21_09_00).save
		FactoryGirl.build(:attention_time, :available_clinic_at_2013_09_22_09_00).save
		time = Time.zone.local 2013, 9, 22, 9, 00

		# Perform...
		attention_times = AttentionTime.find from_time: time

		# Assert...
		assert attention_times.one?
		assert attention_times.first.time >= time
	end

	def test_find_by_to_time
		# Prepare...
		FactoryGirl.build(:attention_time, :available_clinic_at_2013_09_21_09_00).save
		FactoryGirl.build(:attention_time, :available_clinic_at_2013_09_22_09_00).save
		time = Time.zone.local 2013, 9, 21, 9, 00

		# Perform...
		attention_times = AttentionTime.find to_time: time

		# Assert...
		assert attention_times.one?
		assert attention_times.first.time <= time
	end

	def test_find_by_from_to_time
		# Prepare...
		FactoryGirl.build(:attention_time, :available_clinic_at_2013_09_20_09_00).save
		FactoryGirl.build(:attention_time, :available_clinic_at_2013_09_21_09_00).save
		FactoryGirl.build(:attention_time, :available_clinic_at_2013_09_22_09_00).save
		from = Time.zone.local 2013, 9, 20, 22, 00
		to = Time.zone.local 2013, 9, 22, 00, 00

		# Perform...
		attention_times = AttentionTime.find from_time: from, to_time: to

		# Assert...
		assert attention_times.one?
		assert attention_times.first.time > from
		assert attention_times.first.time < to
	end
end
