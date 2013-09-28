FactoryGirl.define do
	factory :medical_specialization do
		trait :clinic do
			name "Clinic"
		end
		trait :pediatrician do
			name "Pediatrician"
		end
	end
end
