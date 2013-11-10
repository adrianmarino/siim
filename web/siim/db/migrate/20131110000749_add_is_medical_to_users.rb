class AddIsMedicalToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_medical, :boolean
  end
end
