# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :medical_attention_time do
		trait :available_clinic do
			time Time.zone.local(2013, 9, 22, 9, 30)
			association :medical, :clinic, factory: :medical, strategy: :build
		end
		trait :reserved_pediatrician do
			time Time.zone.local(2013, 9, 22, 9, 30)
			state :reserved
			association :medical, :pediatrician, factory: :medical, strategy: :build
		end
  end
end
