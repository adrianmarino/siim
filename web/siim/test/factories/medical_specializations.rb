FactoryGirl.define do
	factory :medical_specialization do
		trait :clinic do
			sequence :name do |n|
				"Clinic#{n.to_s}"
			end
		end
		trait :pediatrician do
			sequence :name do |n|
				"Pediatrician#{n.to_s}"
			end
		end
	end
end
