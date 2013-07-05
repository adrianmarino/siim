class CreateVaccines < ActiveRecord::Migration
  def change
    create_table :vaccines do |t|
      t.string :name
      t.date :last_application

      t.timestamps
    end
  end
end
