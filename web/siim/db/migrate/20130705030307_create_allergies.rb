class CreateAllergies < ActiveRecord::Migration
  def change
    create_table :allergies do |t|
      t.string :cause
      t.string :observations
      t.date :record_date
      t.boolean :severity

      t.timestamps
    end
  end
end
