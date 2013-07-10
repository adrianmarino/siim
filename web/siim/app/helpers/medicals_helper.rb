module MedicalsHelper
  # -------------------------------------------------------------------------
  # Public Methods...
  # -------------------------------------------------------------------------
  def sex_values
    [ option(:sex, :male) , option(:sex,:female) ]
  end

  def blood_types
    [
      option(:blood_type,:o_positive),
      option(:blood_type,:o_negative),
      option(:blood_type,:a_positive),
      option(:blood_type,:a_negative),
      option(:blood_type,:b_positive),
      option(:blood_type,:b_negative),
      option(:blood_type,:ab_positive),
      option(:blood_type,:ab_negative)
    ]
  end

  # -------------------------------------------------------------------------
  # Private Methods...
  # -------------------------------------------------------------------------
  def option(a_field, a_value)
    [t("#{a_field}.#{a_value}"),a_value]
  end
end
