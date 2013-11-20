class AddIndexOnPatientToAppointments < ActiveRecord::Migration
	def change
		add_index :appointments, :patient_id
	end
end
