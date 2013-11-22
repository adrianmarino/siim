class CreateMedicals < ActiveRecord::Migration
	def change
		create_table :medicals do |t|
			t.string :cuil, :null => false, :default => ""
			t.string :dni, :null => false, :default => ""
			t.string :firstname, :null => false, :default => ""
			t.string :lastname, :null => false, :default => ""
			t.string :email
			t.string :home_phone, :null => false, :default => ""
			t.string :movile_phone, :null => false, :default => ""
		end
#		add_index :medicals, :cuil, :unique => true
#		add_index :medicals, :dni, :unique => true
	end
end
