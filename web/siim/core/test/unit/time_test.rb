require 'test_helper'

class TimeTest < ActiveSupport::TestCase
	# -------------------------------------------------------------------------
	# Test Methods...
	# -------------------------------------------------------------------------
	test "new from" do
		# Prepare...
		hour = 9
		min = 30

		# Perform...
		time  = Time.new_from hour: hour, min: min

		# Assert...
		assert_equal 9, time.hour
		assert_equal 30, time.min
	end
end