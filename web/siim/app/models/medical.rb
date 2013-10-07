class Medical < ActiveRecord::Base
  include Comparable

  # -------------------------------------------------------------------------
  # Attributes...
  # -------------------------------------------------------------------------
  attr_accessible :cuil, :dni, :email, :firstname, :lastname,
    :home_phone, :movile_phone, :medical_specialization,
    :medical_specialization_id, :attention_periods, 
    :attention_time_length_hour, :attention_time_length_minutes, :user,
    :user_id, :registration_number

  # -------------------------------------------------------------------------
  # Associations...
  # -------------------------------------------------------------------------
  belongs_to :medical_specialization
  belongs_to :user
  has_many :consultations
  has_many :attention_periods

  # -------------------------------------------------------------------------
  # Validations...
  # -------------------------------------------------------------------------
  #validates :cuil, :dni, :firstname, :lastname, :medical_specialization, :email,
  #  :movile_phone, :presence => true

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

  def attention_periods_on(a_date)
    attention_periods.select do |a_period| a_period.week_day == a_date.wday end
  end

  def appointments_by_period_on(a_date)
    periods = attention_periods_on a_date
    periods.collect do |a_period|
      begin_time = a_period.begin_time_on a_date
      end_time = a_period.end_time_on a_date
      lenght = attention_length_time
      TimeHelper.create_times start_time: begin_time, end_time: end_time, increment: lenght
    end
  end

  def appointments_on(a_date)
    self.appointments_by_period_on(a_date).flatten
  end

  def attention_length_time
    Time.new_from hour: self.attention_time_length_hour, min: self.attention_time_length_minutes
  end
end
