class AddPatientIndexToContacts < ActiveRecord::Migration
	def change
		add_index :contacts, :patient_id
	end
end
