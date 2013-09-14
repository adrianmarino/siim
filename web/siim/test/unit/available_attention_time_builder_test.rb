require 'test_helper'

class AvailableAttentionTimeBuilderTest < ActiveSupport::TestCase
	# -------------------------------------------------------------------------
	# Test Methods...
	# -------------------------------------------------------------------------
	test "build attention time period" do
		# Prepare...
		from = Time.zone.today
		to = from + 1.week
		# Medicals
		medicals = [FactoryGirl.build(:medical, :clinic), FactoryGirl.build(:medical, :pediatrician)]
		# Builder
		builder = AvailableAttentionTimeBuilder.new
		builder.from = from
		builder.to = to
		builder.medicals = medicals

		# Perform...
		# available_times = builder.build

		# Assert...
		#available_times.each do |a_time|
		#	periods = a_time.medical_attention_periods_on_same_day
		#	assert_attention_time_is_included_on_any_period a_time, periods
		#end
	end

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def assert_attention_time_is_included_on_any_period(a_time, periods)
		periods.any? { |a_period| period.include? a_time }
	end
end