class AttentionTime < ActiveRecord::Base
	include Workflow
  # -------------------------------------------------------------------------
  # Instance methods
  # -------------------------------------------------------------------------
  def ==(an_other)
    self.time == an_other.time && self.medical == an_other.medical && self.patient == an_other.patient && self.current_state == an_other.current_state
  end

  def medical_attention_periods_on_same_day
      week_day = self.time.wday
      self.medical.attention_periods_by_week_day week_day
  end

  def hour
    self.time.hour
  end

  def min
    self.time.min
  end

  def after_begin_time_of?(a_period)
    self.hour > a_period.begin_hour || (self.hour == a_period.begin_hour && self.min >= a_period.begin_minutes)
  end

  def before_end_time_of?(a_period)
    self.hour < a_period.end_hour || (self.hour == a_period.end_hour && self.min < a_period.end_minutes)
  end

  # -------------------------------------------------------------------------
  # Class methods
  # -------------------------------------------------------------------------
  def self.find(criterions)
    self.includes(:medical).where find_conditions_from(criterions)
  end

	# -------------------------------------------------------------------------
	# Workflow...
	# -------------------------------------------------------------------------
	workflow do
    state :available do
      event :reserve, :transitions_to => :reserved
    end
    state :reserved do
      event :liberate, :transitions_to => :available
    end
    state :attended do
      event :attend, :transitions_to => :attend
    end
  end

	# -------------------------------------------------------------------------
	# Attributes
	# -------------------------------------------------------------------------
	attr_accessible :time, :state, :medical, :patient
	workflow_column :state

  # -------------------------------------------------------------------------
  # Associations
  # -------------------------------------------------------------------------
  belongs_to :medical
  belongs_to :patient

  # -------------------------------------------------------------------------
  # Validations
  # -------------------------------------------------------------------------
  validates :time, :medical, :presence => true

  # -------------------------------------------------------------------------
  # Private Methods
  # -------------------------------------------------------------------------
  private
  def self.find_conditions_from(criterions)
    conditions = {}
    conditions["medicals.medical_specialization_id"] = criterions[:specialization] if criterions[:specialization] != nil
    conditions["medical_id"] = criterions[:medical] if criterions[:medical] != nil
    conditions["patient_id"] = criterions[:patient] if criterions[:patient] != nil
    conditions["state"] = criterions[:state] if criterions[:state] != nil
    conditions["time"] = time_range criterions[:from], criterions[:to]
    conditions
  end

  def self.time_range(a_from, a_to)
    from = a_from != nil ? a_from : Time.new(1900,1,1)
    to = a_to != nil ? a_to : Time.new(3000,1,1)
    from..to
  end
end
