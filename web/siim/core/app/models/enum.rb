class Enum
  # -------------------------------------------------------------------------
  # Public Methods...
  # -------------------------------------------------------------------------
  def self.values
  	@values
  end

  def self.values_sorted_by_translate
  	self.values.sort {|a,b| a.translate <=> b.translate }
  end

  def self.enum(*syms)
  	@values = []
    syms.each { |a_symbol|
     	constant = Constant.new(self, a_symbol)
     	@values << constant
     	const_set(a_symbol, constant)
   	}
  end

  def self.class_name
    self.name.downcase
  end
end