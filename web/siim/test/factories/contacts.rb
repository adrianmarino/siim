# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    firstname "MyString"
    lastname "MyString"
    email "MyString"
    home_phone "MyString"
    movile_phone "MyString"
  end
end
