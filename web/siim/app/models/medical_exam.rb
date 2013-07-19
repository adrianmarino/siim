class MedicalExam < ActiveRecord::Base
  # -------------------------------------------------------------------------
  # Attributes...
  # -------------------------------------------------------------------------
  attr_accessible :achievement_date, :name, :results, :observations,
    :medical_history, :medical_history_id

  # -------------------------------------------------------------------------
  # Associations...
  # -------------------------------------------------------------------------
  belongs_to :medical_history

  # -------------------------------------------------------------------------
  # Validations...
  # -------------------------------------------------------------------------
  validates :achievement_date, :name, :results, presence: true
end
