class CreateMedicalAttentionDay < ActiveRecord::Migration
	def change
		create_table :medical_attention_days do |a_table|
			a_table.datetime :begin_time
			a_table.datetime :end_time
			a_table.string :name
			a_table.references :medical

			a_table.timestamps
		end
		add_index :medical_attention_days, [:medical_id, :name]
	end
end
