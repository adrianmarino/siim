require 'test_helper'

class DateTest < ActiveSupport::TestCase
	# -------------------------------------------------------------------------
	# Test Methods...
	# -------------------------------------------------------------------------
	test "as date" do
		# Prepare...
		date = Date.new

		# Perform...
		time = date.as_time

		# Assert...
		assert time.kind_of? Time
		assert_equal date.year, time.year
		assert_equal date.month, time.month
		assert_equal date.day, time.day
	end
end