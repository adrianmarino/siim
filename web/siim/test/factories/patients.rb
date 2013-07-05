# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :patient do
    dni "MyString"
    firstname "MyString"
    lastname "MyString"
    birthdate "2013-07-04"
    height ""
    weight ""
    blood_group "MyString"
    blood_factor "MyString"
    sex "MyString"
    address "MyString"
    home_phone "MyString"
    movile_phone "MyString"
    email "MyString"
  end
end
