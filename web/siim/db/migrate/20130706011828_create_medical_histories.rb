class CreateMedicalHistories < ActiveRecord::Migration
	def change
		create_table :medical_histories do |t|

			t.timestamps
		end
	end
end
