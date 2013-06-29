# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :medical do
    cuil "MyString"
    dni "MyString"
    firstname "MyString"
    lastname "MyString"
    email "MyString"
    specialization "MyString"
  end
end
