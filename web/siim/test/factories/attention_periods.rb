FactoryGirl.define do
	factory :attention_period do

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
	end

	factory :clinical_monday_morning, traits: [:clinical_morning, :monday]
	factory :clinical_tuesday_morning, traits: [:clinical_morning, :tuesday]
	factory :clinical_wednesday_morning, traits: [:clinical_morning, :wednesday]
	factory :clinical_thursday_morning, traits: [:clinical_morning, :thursday]
	factory :clinical_friday_morning, traits: [:clinical_morning, :friday]

	factory :clinical_monday_afternon, traits: [:clinical_afternon, :monday]
	factory :clinical_tuesday_afternon, traits: [:clinical_afternon, :tuesday]
	factory :clinical_wednesday_afternon, traits: [:clinical_afternon, :wednesday]
	factory :clinical_thursday_afternon, traits: [:clinical_afternon, :thursday]
	factory :clinical_friday_afternon, traits: [:clinical_afternon, :friday]

	factory :pediatrician_monday, traits: [:pediatrician_from_14_to_20, :monday]
	factory :pediatrician_thursday, traits: [:pediatrician_from_9_to_14, :thursday]
end
