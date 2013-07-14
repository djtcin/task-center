class Submission < ActiveRecord::Base
  belongs_to :task
  attr_accessible :comment, :grade, :lastupdate, :remember, :submitted, :viewed, :user_id, :archives_attributes, :archivetxt
  has_many :archives, :dependent => :destroy
  attr_accessor :user
  
  #accepts_nested_attributes_for :archives, :allow_destroy => :true,
  #  :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
    
#  validates :name,  :presence => true
#  validates :title, :presence => true,
#                    :length => { :minimum => 5 } 
                    
  def self.from_task(taskId, userId)
    logger.info("\n\n\n VAI PROCURAR \n\n\n") # TODO apagar teste
    return Submission.find(:all, :conditions => {:user_id => userId, :task_id => taskId})
  end
  
  def self.all_from_task(taskId)
    return Submission.find(:all, :conditions => {:task_id => taskId, :submitted => true})
  end
  
  def self.all_from_user(userId, spaceId)
    #return Submission.find(:all, :conditions => {:user_id => userId, :submitted => true})
    #return Submission.find(:all, :conditions => {:user_id => userId, :submitted => true, :space_id => spaceId})
    @submissions = Submission
                  .joins("JOIN tasks ON tasks.id = submissions.task_id")
                  .where("
                        submissions.user_id = ? AND
                        tasks.space_id = ? AND
                        submissions.submitted = ? 
                        ", userId, spaceId, true
                  )
    return @submissions
  end
  
  def self.create_blank(auth)
    logger.info("\n\n\n ENTROU EM CRIAR \n\n\n") # TODO apagar teste
    @task = Task.find(auth[:task_id])
    logger.info("\n\n\n PEGOU O TASK \n\n\n") # TODO apagar teste
    sub = { :user_id => auth[:user_id], 
            :comment => "",
            :archivetxt => "", 
            :grade => nil, 
            :remember => true, 
            :submitted => false, 
            :viewed => false, 
            :lastupdate => Time.now.to_datetime }
    @submission = @task.submissions.create(sub)
    logger.info("\n\n\n CRIOU O SUBMIT \n\n\n") # TODO apagar teste
    return @submission
  end
  

end
