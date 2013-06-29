class RequireUtil

  # -------------------------------------------------------------------------
  # Public Methods...
  # -------------------------------------------------------------------------
  def self.require_all_on(a_path)
    Dir[a_path].sort.each { |a_file| require a_file }
  end

  private_class_method :new
end
