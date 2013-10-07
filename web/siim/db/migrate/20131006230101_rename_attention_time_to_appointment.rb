class RenameAttentionTimeToAppointment < ActiveRecord::Migration
  def up
    rename_table :attention_times, :appointments
  end

  def down
    rename_table :appointments, :attention_times
  end
end
