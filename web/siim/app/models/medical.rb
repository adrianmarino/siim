class Medical < ActiveRecord::Base
  # -------------------------------------------------------------------------
  # Public Methods...
  # -------------------------------------------------------------------------
  def to_s
    "#{firstname} #{lastname}"
  end

  # -------------------------------------------------------------------------
  # Attributes...
  # -------------------------------------------------------------------------
  attr_accessible :cuil, :dni, :email, :firstname, :lastname,
    :home_phone, :movile_phone, :medical_specialization,
    :medical_specialization_id

  # -------------------------------------------------------------------------
  # Associations...
  # -------------------------------------------------------------------------
  belongs_to :medical_specialization
  has_many :consutations

  # -------------------------------------------------------------------------
  # Validations...
  # -------------------------------------------------------------------------
  validates :cuil, :firstname, :lastname, :medical_specialization,
    :movile_phone, :presence => true
end
