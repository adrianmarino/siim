require 'test_helper'

class AvailableAttentionTimeBuilderTest < ActiveSupport::TestCase
	# -------------------------------------------------------------------------
	# Test Methods...
	# -------------------------------------------------------------------------
	def test_method_name
		# Prepare...
		today_date = Time.zone.today
		two_months_later_date = today_date + 2.months
		reserved_attention_times = []

		# Reserved attention times...
		attention_time = FactoryGirl.build :medical_attention_time, :reserved_clinic
		attention_time.time = today_date + 1.week
		reserved_attention_times << attention_time

		attention_time = FactoryGirl.build :medical_attention_time, :reserved_pediatrician
		attention_time.time = today_date + 2.week
		reserved_attention_times << attention_time

		# Medicals...
		medicals = []
		medicals << FactoryGirl.build :medical, :clinic
		medicals << FactoryGirl.build :medical, :pediatrician

		builder = AvailableAttentionTimeBuilder.new
		builder.from today_date
		builder.to two_months_later_date
		builder.reserved_attention_times reserved_attention_times
		builder.medicals = 


		# Perform...
		atention_times = builder.build

		# Assert...

	end

end