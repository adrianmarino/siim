class AddRecordDateIndexToDiseases < ActiveRecord::Migration
	def change
		add_index :diseases, :record_date
	end
end
