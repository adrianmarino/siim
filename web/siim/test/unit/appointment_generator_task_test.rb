require 'test_helper'

class AppointmentGeneratorTaskTest < ActiveSupport::TestCase
	include Assertions
	# -------------------------------------------------------------------------
	# Test Methods...
	# -------------------------------------------------------------------------
	test "startup medical attention times" do
		# Prepare...
		assert Appointment.all.empty?
		assert Medical.all.empty?
		assert SystemProperty.all.empty?
		create_clinica_medical
		FactoryGirl.create :system_property, :window_size_12
		task = AppointmentGeneratorTask.new

		# Perform...
		task.run

		# Assert...
		assert_not_empty Appointment.all
	end


	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def create_clinica_medical
		FactoryGirl.create(:medical, :clinic,
											:attention_period_monday_from_9_to_13,
											:attention_length_of_30_minutes)
	end
end