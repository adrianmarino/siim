class AddSymptompsIndexToConsultation < ActiveRecord::Migration
	def change
		add_index :consultations, :symptomps
	end
end
