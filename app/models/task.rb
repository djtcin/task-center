class Task < ActiveRecord::Base
  belongs_to :space
  attr_accessible :autolock, :date, :description, :hasArchives, :hasComment, :public, :status, :title
  has_many :submissions
end
