class AddMedicalIndexToAppointments < ActiveRecord::Migration
	def change
		add_index :appointments, :medical_id
	end
end
