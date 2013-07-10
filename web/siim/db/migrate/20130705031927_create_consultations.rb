class CreateConsultations < ActiveRecord::Migration
  def change
    create_table :consultations do |t|
      t.date :achievement_date
      t.string :symptomps
      t.string :diagnostic
      t.string :treatment

      t.timestamps
    end
  end
end
