require 'test_helper'

class TimeHelperTestTest < ActiveSupport::TestCase
	# -------------------------------------------------------------------------
	# Test Methods...
	# -------------------------------------------------------------------------
	test "create times from 9:00 am to 10:00 am with increments of 30 minutes" do
		# Prepare...
		start_time = Time.new(2013,1,1,9,0)
		end_time = Time.new(2013,1,1,10,0)
		increment = Time.new(2013,1,1,0,15)

		# Perform...
		times = TimeHelper.create_times start_time: start_time, end_time: end_time, increment: increment

		# Assert...
		assert_equal Time.new(2013,1,1,9,0), times.first
		assert_equal Time.new(2013,1,1,9,15), times.second
		assert_equal Time.new(2013,1,1,9,30), times.third
		assert_equal Time.new(2013,1,1,9,45), times.fourth
	end

	test "create times from 9:00 am to 10:15 am with increments of 30 minutes" do
		# Prepare...
		start_time = Time.new(2013,1,1,9,0)
		end_time = Time.new(2013,1,1,10,15)
		increment = Time.new(2013,1,1,0,20)

		# Perform...
		times = TimeHelper.create_times start_time: start_time, end_time: end_time, increment: increment

		# Assert...
		assert_equal Time.new(2013,1,1,9,0), times.first
		assert_equal Time.new(2013,1,1,9,20), times.second
		assert_equal Time.new(2013,1,1,9,40), times.third
	end
end