class AddRegistrationNumberToMedical < ActiveRecord::Migration
	def change
		change_table :medicals do |a_table|
			a_table.string :registration_number
		end
	end
end
