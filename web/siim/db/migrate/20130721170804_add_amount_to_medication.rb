class AddAmountToMedication < ActiveRecord::Migration
  def change
    add_column :medications, :amount, :decimal
  end
end
