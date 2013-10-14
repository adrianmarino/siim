class MedicalHistory < ActiveRecord::Base
  # -------------------------------------------------------------------------
  # Public Methods...
  # -------------------------------------------------------------------------
  def initialize_with_associations
    a_patient = Patient.new
    a_patient.medical_history = self
    self.patient = a_patient
  end

  def as_json(options={})
    super(
      :only => [:id],
      :include =>  {
        :patient => { :only => [:dni, :firstname, :lastname, :birthdate, :blood_type,
                                :height, :weight, :sex, :address, :email, :home_phone, :movile_phone] 
                    },
        :allergies => {:only =>[:cause]},
        :antecedents => { :only => [:description]},
        :consultations => {:only=>[:diagnostic]},
        :diseases => {:only =>[:name]},
        :medications => {:only => [:name,:dose,:how_often]},
        :vaccines => {:only => [:last_application, :name]},
        :medical_exams => {:only => [:achievement_date, :name]}
      }
    )
  end

  # -------------------------------------------------------------------------
  # Public Class Methods...
  # -------------------------------------------------------------------------
  def self.find_by_dni(a_dni)
    MedicalHistory.includes(:patient).where("patients.dni=?",a_dni).first
  end

  def self.find_by_patient(a_patient)
    MedicalHistory.includes(:patient).where("patients.id=?",a_patient.id).first
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
  has_many  :allergies, dependent: :delete_all
  has_many  :antecedents, dependent: :delete_all
  has_many  :consultations, dependent: :delete_all
  has_many  :diseases, dependent: :delete_all
  has_many  :medical_exams, dependent: :delete_all
  has_many  :medications, dependent: :delete_all
  has_many  :vaccines, dependent: :delete_all
  has_one   :patient, dependent: :delete

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
