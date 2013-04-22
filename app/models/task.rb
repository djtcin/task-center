class Task < ActiveRecord::Base
  belongs_to :space
  attr_accessible :autolock, :date, :description, :hasArchives, :hasComment, :public, :status, :title
  has_many :submissions
  
  def self.all_open(spaceId)
    
    Task.find(:all, :conditions => {:status => true, 'space_id' => spaceId})
    
    #Task.where("status = true AND space_id = ?", spaceId)
  #  User.joins(:notifications)
  #      .joins("LEFT JOIN `company_users` ON `company_users`.`user_id` = `users`.`id`")
  #      .joins(:role_users)
  #      .where("notifications.id = ? AND role_users.role_id != '1' AND (company_users.company_id = ? OR users.company_id = ?)", notification.id, p.company_id, p.company_id)
    #all :conditions => {:status => true}
    # values = Task.find :all, :order => 'id DESC',
    #:conditions => 'status = "true"'
  end
  
  def self.all_close(spaceId)
    Task.find(:all, :conditions => {:status => false, 'space_id' => spaceId})
  end
  
  def self.all_pending(spaceId)
    Task.find(:all, :conditions => {'space_id' => spaceId})
  end

end
