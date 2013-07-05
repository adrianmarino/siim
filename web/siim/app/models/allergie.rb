class Allergie < ActiveRecord::Base
  attr_accessible :cause, :observations, :record_date, :severity
end
