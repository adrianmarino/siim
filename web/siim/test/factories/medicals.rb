# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :medical do
    cuil "MyString"
    dni "MyString"
    firstname "MyString"
    lastname "MyString"
    email "MyString"
    specialization "MyString"
    home_phone "MyString"
    movile_phone "MyString"
  end
end
