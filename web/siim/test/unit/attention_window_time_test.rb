require 'test_helper'

class AttentionWindowTimeTest < ActiveSupport::TestCase
	# -------------------------------------------------------------------------
	# Test Methods...
	# -------------------------------------------------------------------------
	test "new 10 days window time with last date less than to today date" do
		# Prepare...
		last_date = Date.today - 5.days
		window_size = 10

		# Perform...
		window_time = AttentionWindowTime.new_from last_date, window_size

		# Assert...
		assert_equal Date.today, window_time.from
		assert_equal Date.today + 9.days, window_time.to
	end

	test "new 1 day window time with last date less than to today date" do
		# Prepare...
		last_date = Date.today - 1.days
		window_size = 1

		# Perform...
		window_time = AttentionWindowTime.new_from last_date, window_size

		# Assert...
		assert_equal Date.today, window_time.from
		assert_equal Date.today, window_time.to
	end

	test "new 10 days window time with last date equal to today date" do
		# Prepare...
		last_date = Date.today
		window_size = 10

		# Perform...
		window_time = AttentionWindowTime.new_from last_date, window_size

		# Assert...
		assert_equal Date.today + 1.day, window_time.from
		assert_equal Date.today + 10.days, window_time.to
	end

	test "new 1 day window time with last date equal to today date" do
		# Prepare...
		last_date = Date.today
		window_size = 1

		# Perform...
		window_time = AttentionWindowTime.new_from last_date, window_size

		# Assert...
		assert_equal Date.today + 1.day, window_time.from
		assert_equal Date.today + 1.day, window_time.to
	end

	test "new 10 days window time with last date greater than today date" do
		# Prepare...
		last_date = Date.today + 5.days
		window_size = 10

		# Perform...
		window_time = AttentionWindowTime.new_from last_date, window_size

		# Assert...
		assert_equal last_date + 1.days, window_time.from
		assert_equal last_date + 5.days, window_time.to
	end

	test "new 1 day window time with last date greater than today date" do
		# Prepare...
		last_date = Date.today + 5.days
		window_size = 1

		# Perform...
		window_time = AttentionWindowTime.new_from last_date, window_size

		# Assert...
		assert_nil window_time
	end

	test "new 10 days window time with last date equal to today date plus one day" do
		# Prepare...
		last_date = Date.today + 1.days
		window_size = 10

		# Perform...
		window_time = AttentionWindowTime.new_from last_date, window_size

		# Assert...
		assert_equal Date.today + 2.days, window_time.from
		assert_equal Date.today + 10.days, window_time.to
	end

	test "get range of times" do
		# Prepare...
		last_date = Date.today
		window_size = 10
		window_time = AttentionWindowTime.new_from last_date, window_size

		# Perform...
		range = window_time.range

		assert_equal (Date.today+1.days)..(Date.today+10.days), range
	end


end