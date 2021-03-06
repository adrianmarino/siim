class Medication < ActiveRecord::Base
  # -------------------------------------------------------------------------
  # Attributes...
  # -------------------------------------------------------------------------
  attr_accessible :begin_date, :dose, :end_date, :amount, :name, :route,
    :medical_history, :medical_history_id

  # -------------------------------------------------------------------------
  # Associations...
  # -------------------------------------------------------------------------
  belongs_to :medical_history, touch: true

  # -------------------------------------------------------------------------
  # Validations...
  # -------------------------------------------------------------------------
  validates :name, :dose, :amount, presence: true
end
