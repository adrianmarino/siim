class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :home_phone
      t.string :movile_phone

      t.timestamps
    end
  end
end
