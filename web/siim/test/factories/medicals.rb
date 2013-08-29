FactoryGirl.define do
  factory :medical do
    trait :clinic do
      cuil "20-29042902-2"
      firstname "Adrian Norberto"
      lastname "Marino"
      association :medical_specialization, :clinic, factory: :medical_specialization
      movile_phone "15 2509 1981"
    end

    trait :pediatrician do
      cuil "20-29042999-1"
      firstname "Juan Pablo"
      lastname "Perez"
      association :medical_specialization, :pediatrician, factory: :medical_specialization
      movile_phone "15 2509 9999"
    end
  end
end