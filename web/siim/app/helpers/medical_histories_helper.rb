module MedicalHistoriesHelper
  # include CrudFormHelper

  # -------------------------------------------------------------------------
  # Public Methods...
  # -------------------------------------------------------------------------
  def section(a_name)
    content_tag :h5 do t "activerecord.attributes.medical_history.#{a_name}" end
  end
end
