class CreateAttentionPeriod < ActiveRecord::Migration
	def change
		create_table :attention_periods do |a_table|
			a_table.integer :begin_hour
			a_table.integer :begin_minutes
			a_table.integer :end_hour
			a_table.integer :end_minutes
			a_table.integer :week_day
			a_table.references :medical

			a_table.timestamps
		end
	end
end
