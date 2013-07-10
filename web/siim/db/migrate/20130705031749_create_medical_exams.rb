class CreateMedicalExams < ActiveRecord::Migration
  def change
    create_table :medical_exams do |t|
      t.date :achievement_date
      t.string :name
      t.string :results
      t.string :observations

      t.timestamps
    end
  end
end
