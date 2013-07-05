class Contact < ActiveRecord::Base
  attr_accessible :email, :firstname, :home_phone, :lastname, :movile_phone
end
