class Date
  # -------------------------------------------------------------------------
  # Public Methods...
  # -------------------------------------------------------------------------
  def as_time
    Time.new year, month, day
  end

end

class Time
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
  def self.new_from(args)
    date = args[:date].nil? ? Date.new : args[:date]

    date.as_time.midnight + args[:hour].hours + args[:min].minutes
  end

  def sum_of_hours_and_minutes_in_seconds
    self.hour.hours + self.min.minutes
  end
end

class String
  # -------------------------------------------------------------------------
  # Public Methods...
  # -------------------------------------------------------------------------
  def capitalize_first_character
    tmp = self
    tmp[0] = tmp.capitalize[0]
    tmp
  end

  def contains(an_other_string)
    self.index(an_other_string) != nil
  end

  def remove_first
    self[1..-1]
  end

  def to_instance_variable_name
    String::at + self
  end

  def sub_after_last(a_pattern)
    self.split(a_pattern).last
  end

  def sub_before_last(a_pattern)
    self[0..self.rindex(a_pattern)-1]
  end

  def self.empty
    ""
  end

  def self.white_space
    ' '
  end

  def self.equal
    '='
  end

  def self.new_line
    "\n"
  end

  def self.at
    '@'
  end

  def self.quote
    "\""
  end
end
