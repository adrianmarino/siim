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

  def attention_periods_by_week_day(a_week_day)
    self.attention_periods select do|a_period| a_period.week_day == a_week_day end
  end

  # -------------------------------------------------------------------------
  # Attributes...
  # -------------------------------------------------------------------------
  attr_accessible :cuil, :dni, :email, :firstname, :lastname,
    :home_phone, :movile_phone, :medical_specialization,
    :medical_specialization_id, :attention_periods

  # -------------------------------------------------------------------------
  # Associations...
  # -------------------------------------------------------------------------
  belongs_to :medical_specialization
  has_many :consutations
  has_many :attention_periods

  # -------------------------------------------------------------------------
  # Validations...
  # -------------------------------------------------------------------------
  validates :cuil, :dni, :firstname, :lastname, :medical_specialization,
    :movile_phone, :presence => true
end
