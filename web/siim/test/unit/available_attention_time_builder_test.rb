require 'test_helper'

class AvailableAttentionTimeBuilderTest # < ActiveSupport::TestCase
	# -------------------------------------------------------------------------
	# Test Methods...
	# -------------------------------------------------------------------------
	def test_build_attention_time_period
		# Prepare...
		from = Time.zone.today
		to = from + 1.week
		# Medicals
		medicals = []
		medical = FactoryGirl.build :medical, :clinic
		medical.attention_periods << FactoryGirl.build(:attention_period, :clinical_morning, :monday)
		medical.attention_periods << FactoryGirl.build(:attention_period, :clinical_afternon, :monday)
		medical.attention_periods << FactoryGirl.build(:attention_period, :clinical_morning, :wednesday)
		medical.attention_periods << FactoryGirl.build(:attention_period, :clinical_afternon, :wednesday)
		medical.attention_periods << FactoryGirl.build(:attention_period, :clinical_morning, :friday)
		medical.attention_periods << FactoryGirl.build(:attention_period, :clinical_afternon, :friday)
		medicals << medical

		medical = FactoryGirl.build :medical, :pediatrician
		medical.attention_periods << FactoryGirl.build(:attention_period, :pediatrician_from_14_to_20, :monday)
		medical.attention_periods << FactoryGirl.build(:attention_period, :pediatrician_from_9_to_14, :thursday)
		medicals << medical

		builder = AvailableAttentionTimeBuilder.new
		builder.from = from
		builder.to = to
		builder.medicals = medicals

		# Perform...
		available_times = builder.build

		# Assert...
		available_times.each do |a_time|
			periods = a_time.medical_attention_periods_on_same_day
			assert_attention_time_is_included_on_any_period a_time, periods
		end
	end

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def assert_attention_time_is_included_on_any_period(a_time, periods)
		periods.any? { |a_period| period.include? a_time }
	end
end