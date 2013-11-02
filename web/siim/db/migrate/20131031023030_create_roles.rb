class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |a_table|
      a_table.string :name

      a_table.timestamps
    end
  end
end
