class Submission < ActiveRecord::Base
  belongs_to :task
  attr_accessible :comment, :grade, :lastupdate, :remember, :submitted, :viewed, :user_id
  
  
  def self.from_task(taskId, userId)
    logger.info("\n\n\n VAI PROCURAR \n\n\n") # TODO apagar teste
    return Submission.find(:all, :conditions => {:user_id => userId, :task_id => taskId})
  end
  
  def self.create_blank(auth)
    logger.info("\n\n\n ENTROU EM CRIAR \n\n\n") # TODO apagar teste
    @task = Task.find(auth[:task_id])
    logger.info("\n\n\n PEGOU O TASK \n\n\n") # TODO apagar teste
    sub = { :user_id => auth[:user_id], 
            :comment => "", 
            :grade => nil, 
            :remember => true, 
            :submitted => true, 
            :viewed => false, 
            :lastupdate => Time.now.to_datetime }
    @submission = @task.submissions.create(sub)
    logger.info("\n\n\n CRIOU O SUBMIT \n\n\n") # TODO apagar teste
    return @submission
  end
  

end
