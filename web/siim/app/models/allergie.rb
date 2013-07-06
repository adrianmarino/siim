class Allergie < ActiveRecord::Base
  # -------------------------------------------------------------------------
  # Attributes...
  # -------------------------------------------------------------------------
  attr_accessible :cause, :observations, :record_date, :severity, :medical_history

  # -------------------------------------------------------------------------
  # Associations...
  # -------------------------------------------------------------------------
  belongs_to :medical_history
end
