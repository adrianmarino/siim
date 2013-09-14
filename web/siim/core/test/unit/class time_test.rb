require 'test_helper'

class TimeTest < ActiveSupport::TestCase
	# -------------------------------------------------------------------------
	# Test Methods...
	# -------------------------------------------------------------------------
	test "as date" do
		# Prepare...
		time = Time.new

		# Perform...
		date = time.as_date

		# Assert...
		assert date.kind_of? Date
		assert_equal time.year, date.year
		assert_equal time.month, date.month
		assert_equal time.day, date.day
	end
end