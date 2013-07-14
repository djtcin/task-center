class SubmissionsController < ApplicationController
  
  def submit
   
   auth_sub = { :task_id  => params[:id], :user_id  => session[:user_id] } 
   
   @submission = Submission.find(:all, :conditions => {:user_id => session[:user_id], :task_id => params[:id]})
   
   if(@submission.empty?) then 
       @submission = Submission.create_blank(auth_sub)
   end
   
    @task = Task.find(params[:id]);
    #@task = Task.find(:all, :conditions => {:id => params[:id]});  
    
    respond_to do |format|
      format.html # submit.html.erb
      format.json { render :json => { :submission => @submission, :task => @task } }
      #{ render json: @submission }
    end
  end
  

  # GET /fromStudent/1
  # GET /fromStudent.json
  def fromStudent
    @submissions = Submission.all_from_user(params[:id], session[:space_id])
    @user = User.find_user(params[:id], session[:space_id] )
    
    respond_to do |format|
      format.html # fromStudent.html.erb
      #format.json { render json: @submissions }
      format.json { render :json => { :submissions => @submissions, :user => @user } }
    end
  end

  # GET /fromTask/1
  # GET /fromTask.json
  def fromTask
    @submissions = Submission.all_from_task(params[:id])
    @task = Task.find(params[:id])
    
    @submissions.each do |sub|
      #logger.info("\n\n\n\n\nNSUBMISSIONS : "+ sub.user_id) # TODO  apagar teste
      sub.user = User.find_user(sub.user_id, session[:space_id] )
    end
    
    respond_to do |format|
      format.html # fromTask.html.erb
      format.json { render :json => { :submissions => @submissions, :task => @task } }
    end
  end
  
  # GET /students
  # GET /students.json
  def students
    
    @user = User.find(:all, :conditions => {:student => true, :space_id => session[:space_id]})
    
    @user.each do |sub|
      sub.newsubmissions =        
        Submission
        .joins("JOIN tasks ON tasks.id = submissions.task_id")
        .where("
              submissions.user_id = ? AND
              tasks.space_id = ? AND
              submissions.viewed = ? AND
              submissions.submitted = ?
              ", sub.redu_id, session[:space_id], false, true
        ).count

        #logger.info("\n\n\n\n: #{sub.newsubmissions} \n\n\n") # TODO apagar teste
    end
       
    respond_to do |format|
      format.html # students.html.erb
      format.json { render json: @user }
    end
  end
  
  # GET /submissions
  # GET /submissions.json
  def index
    @submissions = Submission.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @submissions }
    end
  end

  # GET /submissions/1
  # GET /submissions/1.json
  def show
    @submission = Submission.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @submission }
    end
  end
  
  def show_task_submission
      @submission = Submission.find(:all, :conditions => {:user_id => session[:user_id], :task_id => params[:id]})
      @task = Task.find(params[:id]); 
    
      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => { :submission => @submission, :task => @task } }
        #{ render json: @submission }
      end
      
      
  end
  
  
  # GET /submissions/new
  # GET /submissions/new.json
  def new
    @submission = Submission.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @submission }
    end
  end

  # GET /submissions/1/edit
  def edit
    @submission = Submission.find(params[:id])
  end

  # POST /submissions
  # POST /submissions.json
  def create
    @submission = Submission.new(params[:submission])

    respond_to do |format|
      if @submission.save
        format.html { redirect_to @submission, notice: 'Submission was successfully created.' }
        format.json { render json: @submission, status: :created, location: @submission }
      else
        format.html { render action: "new" }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /submissions/1
  # PUT /submissions/1.json
  def update
    @submission = Submission.find(params[:id])
    params[:submission][:submitted] = true;    
    respond_to do |format|
      if @submission.update_attributes(params[:submission]) 
        format.html { redirect_to opened_tasks_url }
        format.json { head :no_content }
      else
        format.html { render action: "submit" }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submissions/1
  # DELETE /submissions/1.json
  def destroy
    @submission = Submission.find(params[:id])
    @submission.destroy

    respond_to do |format|
      format.html { redirect_to submissions_url }
      format.json { head :no_content }
    end
  end
end
