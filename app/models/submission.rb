class Submission < ActiveRecord::Base
  belongs_to :task
  belongs_to :user
  attr_accessible :comment, :grade, :lastupdate, :remember, :submitted, :viewed
end
