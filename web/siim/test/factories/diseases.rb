# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :disease do
    record_date "2013-07-05"
    name "MyString"
    observations "MyString"
  end
end
