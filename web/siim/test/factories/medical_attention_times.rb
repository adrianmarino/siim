# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :medical_attention_time do
		trait :available_clinic do
			association :medical, :clinic, factory: :medical, strategy: :build
		end
		trait :reserved_pediatrician do
			state ReservedMedicalAttentionTime.new
			association :medical, :pediatrician, factory: :medical, strategy: :build
		end
  end
end
