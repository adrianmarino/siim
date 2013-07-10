class CreateMedications < ActiveRecord::Migration
  def change
    create_table :medications do |t|
      t.date :begin_date
      t.date :end_date
      t.string :name
      t.string :dose
      t.string :how_often
      t.string :route

      t.timestamps
    end
  end
end
