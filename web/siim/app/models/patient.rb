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
    :medical_history, :medical_history_id, :contacts, :contacts_attributes,
    :_destroy

  attr_accessor :_destroy

  # -------------------------------------------------------------------------
  # Associations...
  # -------------------------------------------------------------------------
  belongs_to :medical_history
  has_many :contacts

  # -------------------------------------------------------------------------
  # Nested attributes...
  # -------------------------------------------------------------------------
  accepts_nested_attributes_for :contacts, allow_destroy: true
end
