class AddMedicalHistoryRefToVaccine < ActiveRecord::Migration
  def change
    change_table :vaccines do |a_table|
      a_table.references :medical_history
    end
  end
end
