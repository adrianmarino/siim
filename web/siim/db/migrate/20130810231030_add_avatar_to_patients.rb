class AddAvatarToPatients < ActiveRecord::Migration
  def self.up
    change_table :patients do |t|
      t.has_attached_file :avatars
    end
  end

  def self.down
    drop_attached_file :patients, :avatar
  end
end
