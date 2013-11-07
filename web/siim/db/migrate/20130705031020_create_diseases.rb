class CreateDiseases < ActiveRecord::Migration
	def change
		create_table :diseases do |t|
			t.date :record_date
			t.string :name
			t.string :observations

			t.timestamps
		end
	end
end
