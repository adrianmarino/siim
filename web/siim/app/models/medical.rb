class Medical < ActiveRecord::Base
  attr_accessible :cuil, :dni, :email, :firstname, :lastname, :specialization, :home_phone, :movile_phone
end
