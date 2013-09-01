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
    end

    trait :pediatrician do
      firstname "Juan Pablo"
      lastname "Perez"
      association :medical_specialization, :pediatrician, factory: :medical_specialization
      movile_phone "15 2509 9999"
    end
  end
end