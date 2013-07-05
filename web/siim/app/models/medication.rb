class Medication < ActiveRecord::Base
  attr_accessible :begin_date, :dose, :end_date, :how_often, :name, :route
end
