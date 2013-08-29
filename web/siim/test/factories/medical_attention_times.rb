# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :medical_attention_time do
		trait :available_clinic do
			association :medical_specialization, :clinic, factory: :medical_specialization
		end
		trait :reserved_pediatrician do
			state ReservedMedicalAttentionTime.new
			association :medical_specialization, :pediatrician, factory: :medical_specialization
		end
  end
end
