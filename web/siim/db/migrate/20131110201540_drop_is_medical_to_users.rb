class DropIsMedicalToUsers < ActiveRecord::Migration
	def change
		remove_column :users, :is_medical
	end
end
