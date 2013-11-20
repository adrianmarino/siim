class AddAchevementDateIndexToConsultation < ActiveRecord::Migration
	def change
		add_index :consultations, :achievement_date
	end
end
