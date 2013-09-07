FactoryGirl.define do
  factory :medical_attention_time do
		association :patient, factory: :patient, strategy: :build

		trait :available_clinic_at_2013_09_22_09_00 do
			time Time.zone.local(2013, 9, 22, 9, 0)
			association :medical, :clinic, factory: :medical, strategy: :build
		end

		trait :available_clinic_at_2013_09_21_09_00 do
			time Time.zone.local(2013, 9, 21, 9, 0)
			association :medical, :clinic, factory: :medical, strategy: :build
		end

		trait :available_clinic_at_2013_09_20_09_00 do
			time Time.zone.local(2013, 9, 20, 9, 0)
			association :medical, :clinic, factory: :medical, strategy: :build
		end

		trait :reserved_clinic_at_2013_09_22_09_30 do
			time Time.zone.local(2013, 9, 22, 9, 30)
			state :reserved
			association :medical, :clinic, factory: :medical, strategy: :build
		end

		trait :reserved_clinic do
			state :reserved
			association :medical, :clinic, factory: :medical, strategy: :build
		end

		trait :reserved_pediatrician do
			state :reserved
			association :medical, :pediatrician, factory: :medical, strategy: :build
		end

		trait :reserved_pediatrician_at_2013_09_22_10_00 do
			time Time.zone.local(2013, 9, 22, 10, 0)
			state :reserved
			association :medical, :pediatrician, factory: :medical, strategy: :build
		end
  end
end
