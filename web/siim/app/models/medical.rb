class Medical < ActiveRecord::Base
  include Comparable

  # -------------------------------------------------------------------------
  # Public Methods...
  # -------------------------------------------------------------------------
  def to_s
    "#{firstname} #{lastname}"
  end

  def <=>(an_other)
    if self.to_s < an_other.to_s
      -1
    elsif self.to_s > an_other.to_s
      1
    else
      0
    end
  end

  # -------------------------------------------------------------------------
  # Attributes...
  # -------------------------------------------------------------------------
  attr_accessible :cuil, :dni, :email, :firstname, :lastname,
    :home_phone, :movile_phone, :medical_specialization,
    :medical_specialization_id, :medical_attention_days

  # -------------------------------------------------------------------------
  # Associations...
  # -------------------------------------------------------------------------
  belongs_to :medical_specialization
  has_many :consutations
  has_many :medical_attention_days

  # -------------------------------------------------------------------------
  # Validations...
  # -------------------------------------------------------------------------
  validates :cuil, :dni, :firstname, :lastname, :medical_specialization,
    :movile_phone, :presence => true
end
