class AddTimeIndexToAppointments < ActiveRecord::Migration
	def change
		add_index :appointments, :time
	end
end
