require 'test_helper'

class AttentionTimeTest < ActiveSupport::TestCase
	include Assertions
	# -------------------------------------------------------------------------
	# Test Methods...
	# -------------------------------------------------------------------------
	test "find by specialization" do
		# Prepare...
		FactoryGirl.create :attention_time, :reserved_pediatrician_at_2013_09_22_10_00
		attention_time = FactoryGirl.create :attention_time, :available_clinic_at_2013_09_22_09_00
		specialization = attention_time.medical.medical_specialization

		# Perform...
		attention_times = AttentionTime.find specialization: specialization

		# Assert...
		assert_not_empty attention_times
		assert_has_only_one attention_times
		assert_equal specialization, attention_times.first.medical.medical_specialization
	end

	test "find by medical" do
		# Prepare...
		FactoryGirl.build(:attention_time, :available_clinic_at_2013_09_22_09_00).save
		attention_time = FactoryGirl.build :attention_time, :reserved_pediatrician_at_2013_09_22_10_00
		attention_time.save
		medical = attention_time.medical

		# Perform...
		attention_times = AttentionTime.find medical: medical

		# Assert...
		assert_not_empty attention_times
		assert_has_only_one attention_times
		assert_equal medical, attention_times.first.medical
	end

	test "find by patient" do
		# Prepare...
		FactoryGirl.build(:attention_time, :available_clinic_at_2013_09_22_09_00).save
		attention_time = FactoryGirl.build :attention_time, :reserved_pediatrician_at_2013_09_22_10_00
		patient = attention_time.patient
		attention_time.save

		# Perform...
		attention_times = AttentionTime.find patient: patient

		# Assert...
		assert_has_only_one attention_times
		assert_equal patient, attention_times.first.patient
	end

	test "find by state" do 
		# Prepare...
		FactoryGirl.build(:attention_time, :reserved_clinic_at_2013_09_22_09_30).save
		FactoryGirl.build(:attention_time, :available_clinic_at_2013_09_22_09_00).save
		state = :available

		# Perform...
		attention_times = AttentionTime.find state: state

		# Assert...
		assert_has_only_one attention_times
		assert_equal state, attention_times.first.current_state.name
	end

	test "find by from time" do
		# Prepare...
		FactoryGirl.build(:attention_time, :available_clinic_at_2013_09_21_09_00).save
		FactoryGirl.build(:attention_time, :available_clinic_at_2013_09_22_09_00).save
		time = Time.zone.local 2013, 9, 22, 9, 00

		# Perform...
		attention_times = AttentionTime.find from: time

		# Assert...
		assert_has_only_one attention_times
		assert attention_times.first.time >= time
	end

	test "find by to time" do
		# Prepare...
		FactoryGirl.build(:attention_time, :available_clinic_at_2013_09_21_09_00).save
		FactoryGirl.build(:attention_time, :available_clinic_at_2013_09_22_09_00).save
		time = Time.zone.local 2013, 9, 21, 9, 00

		# Perform...
		attention_times = AttentionTime.find to: time

		# Assert...
		assert_has_only_one attention_times
		assert attention_times.first.time <= time
	end

	test "find by from to time" do
		# Prepare...
		FactoryGirl.build(:attention_time, :available_clinic_at_2013_09_20_09_00).save
		FactoryGirl.build(:attention_time, :available_clinic_at_2013_09_21_09_00).save
		FactoryGirl.build(:attention_time, :available_clinic_at_2013_09_22_09_00).save
		from = Time.zone.local 2013, 9, 20, 22, 00
		to = Time.zone.local 2013, 9, 22, 00, 00

		# Perform...
		attention_times = AttentionTime.find from: from, to: to

		# Assert...
		assert_has_only_one attention_times
		assert attention_times.first.time > from
		assert attention_times.first.time < to
	end
end
