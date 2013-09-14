require 'test_helper'

class AttentionPeriodTest < ActiveSupport::TestCase
	# -------------------------------------------------------------------------
	# Test Methods...
	# -------------------------------------------------------------------------
	test "begin time on a date" do
		# Prepare...
		period = FactoryGirl.build :attention_period, :from_9_to_13, :monday
		date = Date.new 2013 ,1 ,1
		assert_equal 9, period.begin_hour
		assert_equal 0, period.begin_minutes

		# Perform...
		time = period.begin_time_on date

		# Assert...
		assert_equal Time.new(2013,1,1,9,0), time
	end

	test "end time on a time" do
		# Prepare...
		period = FactoryGirl.build :attention_period, :from_9_to_13
		date = Date.new 2013, 1, 1

		# Perform...
		time = period.end_time_on date

		# Assert...
		assert_equal Time.new(2013,1,1,13,0), time
	end

end