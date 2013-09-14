require 'test_helper'

class AvailableAttentionTimeBuilderTest < ActiveSupport::TestCase
	include AttentionTimeAssertions
	# -------------------------------------------------------------------------
	# Test Methods...
	# -------------------------------------------------------------------------
	test "build 1 week available attention times for two medicals with 
																			distincts dayly attention periods" do
		# Prepare...
		builder = AvailableAttentionTimeBuilder.new
		builder.from = Date.new
		builder.to = builder.from + 1.week
		builder.medicals = [new_clinical_medical, new_pediatrician_medical]
		# Perform...
		times = builder.build

		# Assert...
		times.each do |a_time|
			periods = a_time.medical_attention_periods_on_same_day
			assert_attention_time_is_included_on_any_period a_time, periods
		end
	end

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def new_clinical_medical
		FactoryGirl.build(:medical, :clinic,
											:attention_period_weekly_from_9_to_13_and_from_14_to_18,
											:attention_length_of_10_minutes)
	end

	def new_pediatrician_medical
		FactoryGirl.build(:medical, :pediatrician,
											:attention_period_monday_from_14_to_20_and_thursday_from_9_to_14,
											:attention_length_of_30_minutes)
	end
end