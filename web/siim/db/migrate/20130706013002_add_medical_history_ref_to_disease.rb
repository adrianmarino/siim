class AddMedicalHistoryRefToDisease < ActiveRecord::Migration
  def change
    change_table :diseases do |a_table|
      a_table.references :medical_history
    end
  end
end
