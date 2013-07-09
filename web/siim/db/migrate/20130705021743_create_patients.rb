class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :dni
      t.string :firstname
      t.string :lastname
      t.date :birthdate
      t.decimal :height, :precision => 8, :scale => 2
      t.decimal :weight, :precision => 8, :scale => 2
      t.string :blood_group
      t.string :blood_factor
      t.string :sex
      t.string :address
      t.string :home_phone
      t.string :movile_phone
      t.string :email

      t.timestamps
    end
  end
end
