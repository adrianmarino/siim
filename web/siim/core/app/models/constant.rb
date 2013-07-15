class Constant
  include Comparable

  # -------------------------------------------------------------------------
  # Public Methods...
  # -------------------------------------------------------------------------
  def to_s
    @value
  end

  def to_sym
    @value.to_sym
  end

  def translate
    I18n.t "#{@enum.class_name}.#{@value.downcase}"
  end

  def <=>(an_other)
    if self.to_s < an_other.to_s
      -1
    elsif self.to_s > an_other.to_s
      1
    else
      0
    end
  end

  # -------------------------------------------------------------------------
  # Initialize...
  # -------------------------------------------------------------------------
  def initialize(a_enum, a_value)
    @enum = a_enum
    @value = a_value
  end
end