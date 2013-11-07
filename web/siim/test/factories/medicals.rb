FactoryGirl.define do
	factory :medical do

		sequence :dni do |n|
			n.to_s
		end

		sequence :cuil do |n|
			"#{n}-#{dni}-#{n}"
		end


		trait :clinic do
			firstname "Adrian Norberto"
			lastname "Marino"
			movile_phone "15 2509 1981"
			association :medical_specialization, :clinic, factory: :medical_specialization
		end

		trait :pediatrician do
			firstname "Juan Pablo"
			lastname "Perez"
			movile_phone "15 2509 9999"
			association :medical_specialization, :pediatrician, factory: :medical_specialization
		end

		trait :attention_length_of_30_minutes do
			attention_time_length_hour 0
			attention_time_length_minutes 30
		end

		trait :attention_length_of_10_minutes do
			attention_time_length_hour 0
			attention_time_length_minutes 10
		end

		trait :attention_period_monday_from_9_to_13 do
			after(:build) do |medical|
				FactoryGirl.create :attention_period, :from_9_to_13, :monday, medical: medical
			end
		end


		trait :attention_period_weekly_from_9_to_13_and_from_14_to_18 do
			after(:build) do |medical|
				FactoryGirl.create :attention_period, :from_9_to_13, :monday, medical: medical
				FactoryGirl.create :attention_period, :from_14_to_18, :monday, medical: medical
				FactoryGirl.create :attention_period, :from_9_to_13, :wednesday, medical: medical
				FactoryGirl.create :attention_period, :from_14_to_18, :wednesday, medical: medical
				FactoryGirl.create :attention_period, :from_9_to_13, :friday, medical: medical
				FactoryGirl.create :attention_period, :from_14_to_18, :friday, medical: medical
			end
		end

		trait :attention_period_monday_from_14_to_20_and_thursday_from_9_to_14 do
			after(:build) do |medical|
				FactoryGirl.create :attention_period, :from_9_to_14, :monday, medical: medical
				FactoryGirl.create :attention_period, :from_14_to_20, :thursday, medical: medical
			end
		end
	end
end