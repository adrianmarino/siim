require 'test_helper'

class MedicalTest < ActiveSupport::TestCase
	# -------------------------------------------------------------------------
	# Test Methods...
	# -------------------------------------------------------------------------
	test "attention periods on" do
		# Prepare...
		medical = FactoryGirl.build :medical, :clinic
		date = Date.new 2013, 9, 18

		# Perform...
		pediods = medical.attention_periods_on date

		# Assert...
		assert_equal new_period(9, 0, 13, 0), pediods.first
		assert_equal new_period(14, 0, 18, 0), pediods.second
	end


	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def new_period(begin_hour , begin_minutes , end_hour, end_minutes)
		AttentionPeriod.new(
			begin_hour: begin_hour, begin_minutes: begin_minutes,
			end_hour: end_hour, end_minutes: end_minutes)
	end
end