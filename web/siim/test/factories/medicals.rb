FactoryGirl.define do
  factory :medical do
    trait :clinic do
      dni "999999999"
      cuil "20-999999999-2"
      firstname "Adrian Norberto"
      lastname "Marino"
      association :medical_specialization, :clinic, factory: :medical_specialization
      movile_phone "15 2509 1981"
    end

    trait :pediatrician do
      dni "88888888"
      cuil "20-88888888-1"
      firstname "Juan Pablo"
      lastname "Perez"
      association :medical_specialization, :pediatrician, factory: :medical_specialization
      movile_phone "15 2509 9999"
    end
  end
end