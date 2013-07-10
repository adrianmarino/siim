class Patient < ActiveRecord::Base
  # -------------------------------------------------------------------------
  # Public Methods...
  # -------------------------------------------------------------------------
  def to_s
    "#{self.firstname} #{self.lastname}"
  end

  # -------------------------------------------------------------------------
  # Attributes...
  # -------------------------------------------------------------------------
  attr_accessible :dni, :firstname, :lastname, :birthdate, :blood_type,
    :height, :weight, :sex, :address, :email, :home_phone, :movile_phone,
    :medical_history, :medical_history_id

  # -------------------------------------------------------------------------
  # Associations...
  # -------------------------------------------------------------------------
  belongs_to :medical_history
  has_many :contacts
end
