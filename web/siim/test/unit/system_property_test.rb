require 'test_helper'

class SystemPropertyTest < ActiveSupport::TestCase
	# -------------------------------------------------------------------------
	# Test Methods...
	# -------------------------------------------------------------------------
	test "get window size" do
		# Prepare...
		window_size = FactoryGirl.create :system_property, :window_size_12

		# Perform...
		property = SystemProperty.window_size

		# Assert...
		assert_equal "12", property.value
	end

	test "get window size value" do
		# Prepare...
		window_size = FactoryGirl.create :system_property, :window_size_12

		# Perform...
		value = SystemProperty.window_size_value

		# Assert...
		assert_equal 12, value
	end
end
