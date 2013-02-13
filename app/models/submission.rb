class Submission < ActiveRecord::Base
  belongs_to :task
  attr_accessible :comment, :grade, :lastUpdate, :remember, :studentId, :submitted, :viewed
end
