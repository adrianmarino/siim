class MedicalHistory < ActiveRecord::Base
  # -------------------------------------------------------------------------
  # Associations...
  # -------------------------------------------------------------------------
  has_many :allergies, :antecedents, :consutations, :diseases, :medical_exams, :medications, :vaccines
  has_one :patinent
end
