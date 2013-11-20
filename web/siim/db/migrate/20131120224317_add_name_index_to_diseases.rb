class AddNameIndexToDiseases < ActiveRecord::Migration
	def change
		add_index :diseases, :name
	end
end
