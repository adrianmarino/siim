class MedicalAttentionTime < ActiveRecord::Base
	include Workflow
	# -------------------------------------------------------------------------
	# Finds...
	# -------------------------------------------------------------------------
  def ==(an_other)
      self.time == an_other.time && self.medical == an_other.medical && self.patient == an_other.patient && self.current_state == an_other.current_state
  end

  def self.find(criterions)
      self.includes(:medical).where find_conditions_from criterions
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
	# Attributes...
	# -------------------------------------------------------------------------
	attr_accessible :time, :state, :medical, :patient
	workflow_column :state

  # -------------------------------------------------------------------------
  # Associations...
  # -------------------------------------------------------------------------
  belongs_to :medical
  belongs_to :patient

  # -------------------------------------------------------------------------
  # Validations...
  # -------------------------------------------------------------------------
  validates :time, :medical, :presence => true


  # -------------------------------------------------------------------------
  # Private Methods...
  # -------------------------------------------------------------------------
  private
  def self.find_conditions_from(criterions)
    conditions = {}
    conditions["medicals.medical_specialization_id"] = criterions[:specialization] if criterions[:specialization] != nil
    conditions["medical_id"] = criterions[:medical] if criterions[:medical] != nil
    conditions["patient_id"] = criterions[:patient] if criterions[:patient] != nil
    conditions["time"] = criterions[:time] if criterions[:time] != nil
    conditions["state"] = criterions[:state] if criterions[:state] != nil
    conditions
  end
end
