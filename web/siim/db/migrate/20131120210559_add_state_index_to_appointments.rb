class AddIndexOnStateToAppointments < ActiveRecord::Migration
	def change
		add_index :appointments, :state
	end
end