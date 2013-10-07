require 'test_helper'

class MedicalTest < ActiveSupport::TestCase
	# -------------------------------------------------------------------------
	# Test Methods...
	# -------------------------------------------------------------------------
	test "attention periods on" do
		# Prepare...
		medical = FactoryGirl.build :medical, 
																:clinic, 
																:attention_period_weekly_from_9_to_13_and_from_14_to_18
		date = Date.new 2013, 9, 18

		# Perform...
		pediods = medical.attention_periods_on date

		# Assert...
		assert_equal new_period(9, 0, 13, 0), pediods.first
		assert_equal new_period(14, 0, 18, 0), pediods.second
	end

	test "attention times by period on a date" do
		# Prepare...
		medical = FactoryGirl.build :medical, 
																:clinic,
																:attention_period_weekly_from_9_to_13_and_from_14_to_18, 
																:attention_length_of_30_minutes
		date = Date.new(2013,1,7)

		# Perform...
		times = medical.appointments_by_period_on date

		# Assert...
		assert_appointments	times.first,
												medical.attention_periods.first.begin_time_on(date),
												medical.attention_length_time.sum_of_hours_and_minutes_in_seconds
		assert_appointments	times.second,
												medical.attention_periods.second.begin_time_on(date),
												medical.attention_length_time.sum_of_hours_and_minutes_in_seconds
	end

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def new_period(begin_hour , begin_minutes , end_hour, end_minutes)
		AttentionPeriod.new(
			begin_hour: begin_hour, begin_minutes: begin_minutes,
			end_hour: end_hour, end_minutes: end_minutes)
	end

	def assert_appointments(times, begin_time, attention_length)
		current_time = begin_time
		times.each do |a_time|
			assert_equal current_time, a_time
			current_time = current_time + attention_length
		end
	end
end