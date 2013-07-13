module MedicalsHelper
  # -------------------------------------------------------------------------
  # Public Methods...
  # -------------------------------------------------------------------------
  def sex_values
    Sex.values.sort.collect {|a_value| new_option(a_value) }
  end

  def blood_types
    BloodType.values.sort.collect {|a_value| new_option(a_value) }
  end

  def ==(an_other)
    if other_value.respond_to?(:to_sym)
      self.value.to_sym == an_other.to_sym
    end
  end

  def <(an_other)
    self.value.to_s < an_other.to_s
  end

  def >(an_other)
    self.value.to_s > an_other.to_s
  end

  # -------------------------------------------------------------------------
  # Private Methods...
  # -------------------------------------------------------------------------
  def new_option(a_value)
    [a_value.translate, a_value.to_s]
  end
end
