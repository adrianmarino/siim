require 'test_helper'

class ConstantTest < ActiveSupport::TestCase
	# -------------------------------------------------------------------------
	# Test Methods...
	# -------------------------------------------------------------------------
	test "translate" do
		# Prepare...
		enum = mock()
		enum.expects(:class_name).returns('enum')
		constant = Constant.new(enum,:A)
		
		# Perform...
		value = constant.translate

		# Assert...
		assert_equal "translation missing: en.enum.a", value
	end

	test "compare" do
		# Prepare...
		constant_a = Constant.new(nil,:A)
		constant_b = Constant.new(nil,:B)

		# Assert...
		assert_equal -1, constant_a <=> constant_b

		# Assert...
		assert_equal 0, constant_a <=> constant_a

		# Assert...
		assert_equal 1, constant_b <=> constant_a
	end

end