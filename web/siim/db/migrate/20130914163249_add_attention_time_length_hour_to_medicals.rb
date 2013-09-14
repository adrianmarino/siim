class AddAttentionTimeLengthHourToMedicals < ActiveRecord::Migration
	def change
		change_table :medicals do |a_table|
			a_table.integer :attention_time_length_hour
		end
	end
end
