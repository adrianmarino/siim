module MedicalHistoriesHelper

  # -------------------------------------------------------------------------
  # Public Methods...
  # -------------------------------------------------------------------------
  def section(a_name)
    t "activerecord.attributes.medical_history.#{a_name}"
  end

  def contacts_section
    t "activerecord.attributes.patient.contacts"
  end
end
