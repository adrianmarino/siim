class MedicalHistory < ActiveRecord::Base
  # -------------------------------------------------------------------------
  # Public Methods...
  # -------------------------------------------------------------------------
  def initialize_with_associations
    a_patient = Patient.new
    a_patient.medical_history = self
    self.patient = a_patient
  end

  # -------------------------------------------------------------------------
  # Attributes...
  # -------------------------------------------------------------------------
  attr_accessible :id, :allergies, :antecedents, :consultations, :diseases,
    :medical_exams, :medications, :vaccines, :patient, :allergies_attributes,
    :antecedents_attributes, :consultations_attributes, :diseases_attributes,
    :medical_exams_attributes, :medications_attributes, :vaccines_attributes,
    :patient_attributes, :_destroy

  attr_accessor :_destroy

  # -------------------------------------------------------------------------
  # Associations...
  # -------------------------------------------------------------------------
  has_many  :allergies
  has_many  :antecedents
  has_many  :consultations
  has_many  :diseases
  has_many  :medical_exams
  has_many  :medications
  has_many  :vaccines
  has_one   :patient

  # -------------------------------------------------------------------------
  # Nested attributes...
  # -------------------------------------------------------------------------
  accepts_nested_attributes_for :allergies, allow_destroy: true
  accepts_nested_attributes_for :antecedents, allow_destroy: true
  accepts_nested_attributes_for :consultations, allow_destroy: true
  accepts_nested_attributes_for :diseases, allow_destroy: true
  accepts_nested_attributes_for :medical_exams, allow_destroy: true
  accepts_nested_attributes_for :medications, allow_destroy: true
  accepts_nested_attributes_for :vaccines, allow_destroy: true
  accepts_nested_attributes_for :patient, allow_destroy: true
end
