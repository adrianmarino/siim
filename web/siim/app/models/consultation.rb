class Consultation < ActiveRecord::Base
  # -------------------------------------------------------------------------
  # Attributes...
  # -------------------------------------------------------------------------
  attr_accessible :achievement_date, :diagnostic, :symptomps, :treatment, :medical

  # -------------------------------------------------------------------------
  # Associations...
  # -------------------------------------------------------------------------
  belongs_to :medical
  belongs_to :medical_history
end
