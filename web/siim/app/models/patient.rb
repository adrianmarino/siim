class Patient < ActiveRecord::Base
  attr_accessible :address, :birthdate, :blood_factor, :blood_group, :dni, :email, :firstname, :height, :home_phone, :lastname, :movile_phone, :sex, :weight
end
