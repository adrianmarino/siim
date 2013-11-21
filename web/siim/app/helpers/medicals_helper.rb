module MedicalsHelper
  # -------------------------------------------------------------------------
  # Public Methods...
  # -------------------------------------------------------------------------
  def blood_types
    BloodType.values.sort.collect {|a_value| new_option(a_value) }
  end

  # -------------------------------------------------------------------------
  # Private Methods...
  # -------------------------------------------------------------------------
  def new_option(a_value)
    [a_value.translate, a_value.to_s]
  end
end
