class CreateAntecedents < ActiveRecord::Migration
	def change
		create_table :antecedents do |t|
			t.string :description

			t.timestamps
		end
	end
end
