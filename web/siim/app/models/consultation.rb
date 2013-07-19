class Consultation < ActiveRecord::Base
  # -------------------------------------------------------------------------
  # Attributes...
  # -------------------------------------------------------------------------
  attr_accessible :achievement_date, :diagnostic, :symptomps, :treatment,
    :medical, :medical_id, :medical_history, :medical_history_id

  # -------------------------------------------------------------------------
  # Associations...
  # -------------------------------------------------------------------------
  belongs_to :medical
  belongs_to :medical_history

  # -------------------------------------------------------------------------
  # Validations...
  # -------------------------------------------------------------------------
  validates :achievement_date, :diagnostic, presence: true
end
