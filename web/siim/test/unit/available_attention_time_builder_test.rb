require 'test_helper'

class AvailableAttentionTimeBuilderTest < ActiveSupport::TestCase
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
		medical.medical_attention_days << FactoryGirl.build(:attention_period, :clinical_monday_morning)
		medical.medical_attention_days << FactoryGirl.build(:attention_period, :clinical_monday_afternon)
		medical.medical_attention_days << FactoryGirl.build(:attention_period, :clinical_wednesday_morning)
		medical.medical_attention_days << FactoryGirl.build(:attention_period, :clinical_wednesday_afternon)
		medical.medical_attention_days << FactoryGirl.build(:attention_period, :clinical_friday_morning)
		medical.medical_attention_days << FactoryGirl.build(:attention_period, :clinical_friday_afternon)
		medicals << medical

		medical = FactoryGirl.build :medical, :pediatrician
		medical.medical_attention_days << FactoryGirl.build :attention_period, :pediatrician_monday_afternon
		medical.medical_attention_days << FactoryGirl.build :attention_period, :pediatrician_wednesday_afternon
		medical.medical_attention_days << FactoryGirl.build :attention_period, :pediatrician_friday_afternon
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