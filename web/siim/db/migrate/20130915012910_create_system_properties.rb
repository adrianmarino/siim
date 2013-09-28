class CreateSystemProperties < ActiveRecord::Migration
	def change
		create_table :system_properties do |a_table|
			a_table.string :name
			a_table.string :value
			a_table.timestamps
		end
		add_index :system_properties, :name, :unique => true
	end
end
