class Task < ActiveRecord::Base
  attr_accessible :autolock, :date, :description, :hasArchives, :hasComment, :public, :status, :title
  has_many :submissions
end
