class Task < ActiveRecord::Base
  belongs_to :space
  attr_accessible :autolock, :date, :description, :hasArchives, :hasComment, :public, :status, :title
  has_many :submissions
  
  def self.all_open(spaceId)
    Task.find(:all, :conditions => {:status => true, 'space_id' => spaceId})
  end
  
  def self.all_close(spaceId)
    Task.joins(:submissions).find(:all, :conditions => {:status => false, 'space_id' => spaceId})
  end
  
  def self.all_pending(spaceId, userId)
    Task
    .joins("LEFT OUTER JOIN submissions ON submissions.task_id = tasks.id")
    .where("tasks.space_id = ? 
          AND tasks.status = ? 
          AND (submissions.user_id != ? 
              OR submissions.id IS NULL
              OR (submissions.user_id = ? AND submissions.submitted = ?))", spaceId, true, userId, userId, false)
  end

end
