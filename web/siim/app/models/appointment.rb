class Appointment < ActiveRecord::Base
	include Workflow
  # -------------------------------------------------------------------------
  # Instance methods
  # -------------------------------------------------------------------------
  def ==(an_other)
    self.time == an_other.time && self.medical == an_other.medical && self.patient == an_other.patient && self.current_state == an_other.current_state
  end

  def medical_attention_periods_on_same_day
      self.medical.attention_periods_on time.to_date
  end

  def week_day
    self.time.wday
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

  def to_s
    "Appointment { Time: #{time.strftime("%F %H:%M")}, State: #{state.to_s}, Medical: #{medical}#{patient.nil? ? " }" : ", Patient: #{patient} }"}"
  end

  def liberate
    self.patient = nil
  end

  # -------------------------------------------------------------------------
  # Class methods
  # -------------------------------------------------------------------------
  def self.find(criterions)
    self.includes(:medical).where find_conditions_from(criterions)
  end

  def self.new_available(a_time, a_medical)
    Appointment.new(time: a_time, state: :available, medical: a_medical)
  end

  def self.last
    times = self.order("time DESC").limit 1
    times.empty? ? nil : times.first.time
  end

  def self.all_states
    [:available,:reserved,:attended,:canceled]
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
    state :canceled do
      event :attend, :transitions_to => :cancel
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
  belongs_to :medical, :autosave => true
  belongs_to :patient, :autosave => true

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
