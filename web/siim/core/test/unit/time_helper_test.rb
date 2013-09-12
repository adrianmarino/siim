require 'test_helper'

class TimeHelperTestTest < ActiveSupport::TestCase
	# -------------------------------------------------------------------------
	# Test Methods...
	# -------------------------------------------------------------------------
	def test_create_times
		# Prepare...
		args = { start_time: 9.hours, end_time: 10.hours, increment: 30.minutes }

		# Perform...
		times = TimeHelper.create_times args

		# Assert...
		assert_equal 9, times.first.hour
		assert_equal 0, times.first.min

		assert_equal 9, times.second.hour
		assert_equal 30, times.second.min

		assert_equal 10, times.second.hour
		assert_equal 0, times.second.min
	end
end