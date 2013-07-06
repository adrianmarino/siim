class Contact < ActiveRecord::Base
  # -------------------------------------------------------------------------
  # Attributes...
  # -------------------------------------------------------------------------
  attr_accessible :email, :firstname, :home_phone, :lastname, :movile_phone
end
