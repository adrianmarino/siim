module MedicalHistoriesHelper

  # -------------------------------------------------------------------------
  # Public Methods...
  # -------------------------------------------------------------------------
  def section(a_name)
    t "activerecord.attributes.medical_history.#{a_name}"
  end
end
