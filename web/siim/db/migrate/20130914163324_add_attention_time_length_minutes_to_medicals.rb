class AddAttentionTimeLengthMinutesToMedicals < ActiveRecord::Migration
	def change
		change_table :medicals do |a_table|
			a_table.integer :attention_time_length_minutes
		end
	end
end
