class Disease < ActiveRecord::Base
  # -------------------------------------------------------------------------
  # Public Class Methods...
  # -------------------------------------------------------------------------
  def self.all_record_years
    diseases = select('DISTINCT record_date').order("record_date desc")
    (diseases.collect {|a_result| a_result.record_date.year }).uniq
  end

  # -------------------------------------------------------------------------
  # Attributes...
  # -------------------------------------------------------------------------
  attr_accessible :name, :observations, :record_date, :medical_history,
    :medical_history_id

  # -------------------------------------------------------------------------
  # Associations...
  # -------------------------------------------------------------------------
  belongs_to :medical_history, touch: true

  # -------------------------------------------------------------------------
  # Validations...
  # -------------------------------------------------------------------------
  validates :name, :record_date, presence: true
end
