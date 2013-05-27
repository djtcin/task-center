class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end
  
  # GET /tasks
  # GET /tasks.json
  def pending
    if session[:user_student]
      
      @tasks = Task.all_pending(session[:space_id], session[:user_id])
      respond_to do |format|
        format.html # listStudent.html.erb
        format.json { render json: @tasks }
      end
 
    elsif !session[:user_student]
 
      @tasks = Task.all_pending(session[:space_id], session[:user_id])
      respond_to do |format|
        format.html # listTeacher.html.erb
        format.json { render json: @tasks }
      end 
 
    else
      redirect_to '/error'
    end   
     
  end
  
    # GET /tasks
  # GET /tasks.json
  def open  
    if session[:user_student]
      
      @tasks = Task.all_open(session[:space_id])
      respond_to do |format|
        format.html # listStudent.html.erb
        format.json { render json: @tasks }
      end
 
    elsif !session[:user_student]
 
      @tasks = Task.all_open(session[:space_id])
      respond_to do |format|
        format.html # listTeacher.html.erb
        format.json { render json: @tasks }
      end 
 
    else
      redirect_to '/error'
    end   
 
  end
  
    # GET /tasks
  # GET /tasks.json
  def close
      if session[:user_student]
      
      @tasks = Task.all_close(session[:space_id])
      respond_to do |format|
        format.html # listStudent.html.erb
        format.json { render json: @tasks }
      end
 
    elsif !session[:user_student]
 
      @tasks = Task.all_close(session[:space_id])
      respond_to do |format|
        format.html # listTeacher.html.erb
        format.json { render json: @tasks }
      end 
 
    else
      redirect_to '/error'
    end   
     
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    logger.info("TASKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK SHOW") # TODO  apagar teste
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @space = Space.find(session[:space_id])
    #@task = Task.new(params[:task])
    @task = @space.tasks.create(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Atividade criada com sucesso!' }
        #format.html { render action: "pending" }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "create" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end
  
 
  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end
end
