class CreateMedicalAttentionTime < ActiveRecord::Migration
  def change
    create_table :medical_attention_times do |a_table|
    	a_table.datetime :time
    	a_table.string :state
    	a_table.references :patient
    	a_table.references :medical

    	a_table.timestamps
    end
  end
end
