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
      association :medical_specialization, :clinic, factory: :medical_specialization
      movile_phone "15 2509 1981"
      after(:build) do |medical|
        FactoryGirl.create :attention_period, :from_9_to_13, :monday, medical: medical
        FactoryGirl.create :attention_period, :from_14_to_18, :monday, medical: medical
        FactoryGirl.create :attention_period, :from_9_to_13, :wednesday, medical: medical
        FactoryGirl.create :attention_period, :from_14_to_18, :wednesday, medical: medical
        FactoryGirl.create :attention_period, :from_9_to_13, :friday, medical: medical
        FactoryGirl.create :attention_period, :from_14_to_18, :friday, medical: medical
      end
    end

    trait :pediatrician do
      firstname "Juan Pablo"
      lastname "Perez"
      association :medical_specialization, :pediatrician, factory: :medical_specialization
      movile_phone "15 2509 9999"
      after(:build) do |medical|
        FactoryGirl.create :attention_period, :from_14_to_20, :monday, medical: medical
        FactoryGirl.create :attention_period, :from_9_to_14, :thursday, medical: medical
      end
    end
  end
end