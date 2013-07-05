class Disease < ActiveRecord::Base
  attr_accessible :name, :observations, :record_date
end
