class CreateMedicalAttentionDay < ActiveRecord::Migration
	def change
		create_table :medical_attention_days do |a_table|
			a_table.integer :begin_hour
			a_table.integer :begin_minutes
			a_table.integer :end_hour
			a_table.integer :end_minutes
			a_table.string :name
			a_table.references :medical

			a_table.timestamps
		end
	end
end
