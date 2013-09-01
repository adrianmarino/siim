# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :patient do
    sequence :dni do |n|
      n.to_s
    end

    firstname "Adrian"
    lastname "Marino"
    birthdate Date.new(1981,9,22)
    height "1.76"
    weight "70"
    blood_type "O+"
    sex "Male"
    address "Address"
    home_phone "44444444"
    movile_phone "88888888"
    email "a@b.com"
  end
end
