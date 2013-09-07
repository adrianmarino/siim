FactoryGirl.define do
  factory :allerge, :class => 'Allergie' do
    cause "MyString"
    observations "MyString"
    record_date "2013-07-05"
    severity false
  end
end
