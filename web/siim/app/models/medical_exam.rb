class MedicalExam < ActiveRecord::Base
  attr_accessible :achievement_date, :observations, :results
end
