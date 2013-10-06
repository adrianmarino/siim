require 'test_helper'

class AppointmentTest < ActiveSupport::TestCase
	include Assertions
	include AppointmentAssertions

	# -------------------------------------------------------------------------
	# Test Methods...
	# -------------------------------------------------------------------------
	test "find by specialization" do
		# Prepare...
		FactoryGirl.create :appointment, :reserved_pediatrician_at_2013_09_22_10_00
		appointment = FactoryGirl.create :appointment, :available_clinic_at_2013_09_22_09_00
		specialization = appointment.medical.medical_specialization

		# Perform...
		appointments = Appointment.find specialization: specialization

		# Assert...
		assert_not_empty appointments
		assert_has_only_one appointments
		assert_equal specialization, appointments.first.medical.medical_specialization
	end

	test "find by medical" do
		# Prepare...
		FactoryGirl.build(:appointment, :available_clinic_at_2013_09_22_09_00).save
		appointment = FactoryGirl.build :appointment, :reserved_pediatrician_at_2013_09_22_10_00
		appointment.save
		medical = appointment.medical

		# Perform...
		appointments = Appointment.find medical: medical

		# Assert...
		assert_not_empty appointments
		assert_has_only_one appointments
		assert_equal medical, appointments.first.medical
	end

	test "find by patient" do
		# Prepare...
		FactoryGirl.build(:appointment, :available_clinic_at_2013_09_22_09_00).save
		appointment = FactoryGirl.build :appointment, :reserved_pediatrician_at_2013_09_22_10_00
		patient = appointment.patient
		appointment.save

		# Perform...
		appointments = Appointment.find patient: patient

		# Assert...
		assert_has_only_one appointments
		assert_equal patient, appointments.first.patient
	end

	test "find by state" do 
		# Prepare...
		FactoryGirl.build(:appointment, :reserved_clinic_at_2013_09_22_09_30).save
		FactoryGirl.build(:appointment, :available_clinic_at_2013_09_22_09_00).save
		state = :available

		# Perform...
		appointments = Appointment.find state: state

		# Assert...
		assert_has_only_one appointments
		assert_equal state, appointments.first.current_state.name
	end

	test "find by from time" do
		# Prepare...
		FactoryGirl.build(:appointment, :available_clinic_at_2013_09_21_09_00).save
		FactoryGirl.build(:appointment, :available_clinic_at_2013_09_22_09_00).save
		time = Time.zone.local 2013, 9, 22, 9, 00

		# Perform...
		appointments = Appointment.find from: time

		# Assert...
		assert_has_only_one appointments
		assert appointments.first.time >= time
	end

	test "find by to time" do
		# Prepare...
		FactoryGirl.build(:appointment, :available_clinic_at_2013_09_21_09_00).save
		FactoryGirl.build(:appointment, :available_clinic_at_2013_09_22_09_00).save
		time = Time.zone.local 2013, 9, 21, 9, 00

		# Perform...
		appointments = Appointment.find to: time

		# Assert...
		assert_has_only_one appointments
		assert appointments.first.time <= time
	end

	test "find by from to time" do
		# Prepare...
		FactoryGirl.build(:appointment, :available_clinic_at_2013_09_20_09_00).save
		FactoryGirl.build(:appointment, :available_clinic_at_2013_09_21_09_00).save
		FactoryGirl.build(:appointment, :available_clinic_at_2013_09_22_09_00).save
		from = Time.zone.local 2013, 9, 20, 22, 00
		to = Time.zone.local 2013, 9, 22, 00, 00

		# Perform...
		appointments = Appointment.find from: from, to: to

		# Assert...
		assert_has_only_one appointments
		assert appointments.first.time > from
		assert appointments.first.time < to
	end

	test "medical attention periods on same day" do
		# Prepare...
		time = FactoryGirl.build(:appointment, :available_clinic_at_2013_09_20_09_00)

		# Perform...
		periods = time.medical_attention_periods_on_same_day

		# Assert...
		assert_appointment_is_included_on_any_period(time, periods)
	end
end
