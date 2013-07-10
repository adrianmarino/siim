# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :medical_exam do
    achievement_date "2013-07-05"
    results "MyString"
    observations "MyString"
  end
end
