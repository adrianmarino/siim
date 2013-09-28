require 'test_helper'

class AttentionTimeGeneratorTaskTest < ActiveSupport::TestCase
	include Assertions
	# -------------------------------------------------------------------------
	# Test Methods...
	# -------------------------------------------------------------------------
	test "startup medical attention times" do
		# Prepare...
		assert AttentionTime.all.empty?
		assert Medical.all.empty?
		assert SystemProperty.all.empty?
		create_clinica_medical
		FactoryGirl.create :system_property, :window_size_12
		task = AttentionTimeGeneratorTask.new

		# Perform...
		task.run

		# Assert...
		assert_not_empty AttentionTime.all
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