FactoryGirl.define do
  factory :patient do
    sequence :dni do |n|
     "2904290#{n}"
    end
    sequence :firstname do |n|
      "Adrian#{n}"
    end
    sequence :lastname do |n|
      "Marino#{n}"
    end

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
