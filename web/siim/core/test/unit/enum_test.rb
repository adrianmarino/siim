require 'test_helper'

class EnumTest < ActiveSupport::TestCase
	# -------------------------------------------------------------------------
	# Test Methods...
	# -------------------------------------------------------------------------
	test "values" do
		# Perform...
		values = EnumImpl.values

		# Assert...
		assert_equal :A, values.first.to_sym
		assert_equal :B, values.second.to_sym
	end

	test "values sorted by translate" do
		# Perform...
		values = EnumImpl.values_sorted_by_translate

		# Assert...
		assert_equal "translation missing: en.enumimpl.a", values.first.translate
		assert_equal "translation missing: en.enumimpl.b", values.second.translate
	end
end

class EnumImpl < Enum
	enum :A,:B
end
