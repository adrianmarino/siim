class AddPhotoToPatients < ActiveRecord::Migration
	def self.up
		change_table :patients do |t|
			t.has_attached_file :photo
		end
	end

	def self.down
		drop_attached_file :patients, :photo
	end
end
