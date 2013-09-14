require 'test_helper'

class TimeHelperTestTest < ActiveSupport::TestCase
	# -------------------------------------------------------------------------
	# Test Methods...
	# -------------------------------------------------------------------------
	test "create times" do
		# Prepare...
		args = { :start_time => 9.hours, :end_time => 10.hours, :increment => 30.minutes, :time => Time.zone.local(2013,1,1) }

		# Perform...
		times = TimeHelper.create_times args

		# Assert...
		assert_equal Time.zone.local(2013,1,1,9,0), times.first
		assert_equal Time.zone.local(2013,1,1,9,30), times.second
		assert_equal Time.zone.local(2013,1,1,10,0), times.third
	end

	test "create time" do
		# Prepare...
		hour = 9.hours
		min = 30.minutes
		time = Time.zone.local(2013,1,1)

		# Perform...
		time = TimeHelper.create_time time: time, hour: hour, min: min

		# Assert...
		assert_equal Time.zone.local(2013,1,1,9,30), time
	end
end