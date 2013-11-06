class CreateMedicalSpecializations < ActiveRecord::Migration
	def change
		create_table :medical_specializations do |t|
			t.string :name

			t.timestamps
		end
	end
end
