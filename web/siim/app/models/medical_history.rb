class MedicalHistory < ActiveRecord::Base
  # -------------------------------------------------------------------------
  # Attributes...
  # -------------------------------------------------------------------------
  attr_accessible :id

  # -------------------------------------------------------------------------
  # Associations...
  # -------------------------------------------------------------------------
  has_many :allergies
  has_many :antecedents
  has_many :consutations
  has_many :diseases
  has_many :medical_exams
  has_many :medications
  has_many :vaccines
  has_one :patinent
end
