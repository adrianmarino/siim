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

  def attend_and_save
    self.attend!
    self.save
  end

  def finalize_and_save
    self.finalize!
    self.save
  end

  def liberate_and_save
    self.liberate!
    self.save
  end

  def reserve_and_save(a_patient)
    self.reserve!
    self.patient = a_patient
    self.save
  end


  # -------------------------------------------------------------------------
  # Class methods
  # -------------------------------------------------------------------------
  def self.today_of(a_medical)
    from = Date.today.at_midnight-1.day
    to = Date.today.at_midnight+1.day
    self.find medical: a_medical, from: from, to: to, state: [:reserved,:on_attention]
  end

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
    [:available,:reserved,:on_attention,:attended,:canceled]
  end

	# -------------------------------------------------------------------------
	# Workflow...
	# -------------------------------------------------------------------------
	workflow do
    state :available do
      event :reserve, :transitions_to => :reserved
      event :cancel, :transitions_to => :canceled
    end
    state :reserved do
      event :liberate, :transitions_to => :available
      event :attend, :transitions_to => :on_attention
      event :cancel, :transitions_to => :canceled
    end
    state :on_attention do
      event :finalize, :transitions_to => :attended
    end
    state :canceled do
    end
    state :attended do
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
    from = a_from != nil ? a_from : Time.min
    to = a_to != nil ? a_to : Time.max
    from..to
  end
end
