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

class Numeric
  # -------------------------------------------------------------------------
  # Public Methods...
  # -------------------------------------------------------------------------
  def duration
    secs  = self.to_int
    mins  = secs / 60
    hours = mins / 60
    days  = hours / 24

    if days > 0
      "#{days} days and #{hours % 24} hours"
    elsif hours > 0
      "#{hours} hours and #{mins % 60} minutes"
    elsif mins > 0
      "#{mins} minutes and #{secs % 60} seconds"
    elsif secs >= 0
      "#{secs} seconds"
    end
  end
end