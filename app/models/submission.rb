class Submission < ActiveRecord::Base
  belongs_to :task, :user
  attr_accessible :comment, :grade, :lastUpdate, :remember, :submitted, :viewed
end
