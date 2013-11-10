class AddMovilePhoneToUsers < ActiveRecord::Migration
  def change
    add_column :users, :movile_phone, :string
  end
end
