class AddPatientRefToContact < ActiveRecord::Migration
	def change
		change_table :contacts do |a_table|
			a_table.references :patient
		end
	end
end
