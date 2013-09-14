FactoryGirl.define do
	factory :attention_period do
		trait :from_9_to_13 do
			begin_hour 9
			begin_minutes 0
			end_hour 13
			end_minutes 0
		end

		trait :from_14_to_18 do
			begin_hour 14
			begin_minutes 0
			end_hour 18
			end_minutes 0
		end

		trait :from_14_to_20 do
			begin_hour 14
			begin_minutes 0
			end_hour 20
			end_minutes 0
		end

		trait :from_9_to_14 do
			begin_hour 9
			begin_minutes 0
			end_hour 14
			end_minutes 0
		end

		trait :monday do
			week_day 1
		end

		trait :tuesday do
			week_day 2
		end

		trait :wednesday do
			week_day 3
		end

		trait :thursday do
			week_day 4
		end

		trait :friday do
			week_day 5
		end

	end
end
