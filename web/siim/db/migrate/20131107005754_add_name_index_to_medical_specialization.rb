class AddNameIndexToMedicalSpecialization < ActiveRecord::Migration
	def change
		add_index :medical_specializations, :name, :unique => true
	end
end
