class MedicalExam < ActiveRecord::Base
  # -------------------------------------------------------------------------
  # Attributes...
  # -------------------------------------------------------------------------
  attr_accessible :achievement_date, :name, :results, :observations,
    :medical_history, :medical_history_id

  # -------------------------------------------------------------------------
  # Associations...
  # -------------------------------------------------------------------------
  belongs_to :medical_histor

  # -------------------------------------------------------------------------
  # Validations...
  # -------------------------------------------------------------------------
  validates :achievement_date, :name, :results, presence: true
end
