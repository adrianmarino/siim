class CreateMedicals < ActiveRecord::Migration
  def change
    create_table :medicals do |t|
      t.string :cuil
      t.string :dni
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :specialization

      t.timestamps
    end
  end
end
