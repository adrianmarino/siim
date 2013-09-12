FactoryGirl.define do
	factory :attention_period do

		trait :clinical_morning do
			begin_hour = 9
			end_hour = 13
		end

		trait :clinical_afternon do
			begin_hour = 14
			end_hour = 18
		end

		trait :pediatrician_from_14_to_20 do
			begin_hour = 14
			end_hour = 20
		end

		trait :pediatrician_from_9_to_14 do
			begin_hour = 9
			end_hour = 14
		end

		trait :monday do
			week_day = 1
		end

		trait :tuesday do
			week_day = 2
		end

		trait :wednesday do
			week_day = 3
		end

		trait :thursday do
			week_day = 4
		end

		trait :friday do
			week_day = 5
		end

	end
end
