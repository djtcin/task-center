class SubmissionsController < ApplicationController
  
  def submit
   
   auth_sub = { :task_id  => params[:id], :user_id  => session[:user_id] } 
   
   @submission = Submission.find(:all, :conditions => {:user_id => session[:user_id], :task_id => params[:id]})
   
   if(@submission.empty?) then 
       @submission = Submission.create_blank(auth_sub)
   end
   
   if(!@submission) then
      @submission  =  Submission.create_blank(auth_sub)
   end
   
    @task = Task.find(params[:id]); 
    
    respond_to do |format|
      format.html # submit.html.erb
      format.json { render :json => { :submission => @submission, :task => @task } }
      #{ render json: @submission }
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
