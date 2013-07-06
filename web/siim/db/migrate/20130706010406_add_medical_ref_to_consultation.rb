class AddMedicalRefToConsultation < ActiveRecord::Migration
  def change
    change_table :consultations do |a_table|
      a_table.references :medical
    end
  end
end
