class Patient < ActiveRecord::Base
  # -------------------------------------------------------------------------
  # Attributes...
  # -------------------------------------------------------------------------
  attr_accessible :address, :birthdate, :blood_factor, :blood_group, :dni, :email, :firstname, :height, :home_phone, :lastname, :movile_phone, :sex, :weight

  # -------------------------------------------------------------------------
  # Associations...
  # -------------------------------------------------------------------------
  belongs_to :medical_history
  has_many :contacts
end
