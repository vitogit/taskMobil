class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :start, :stop]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
  end

  def start
    @entry = Entry.new(:task_id => @task.id)

    respond_to do |format|
      if @entry.save
        format.js
      else
        format.js
      end
    end
  end

  def stop
    seconds = Time.now -  @task.entries.last.created_at
    @entry = @task.entries.last
    if @entry
      @entry.hours  = seconds
      @entry.date = Time.now()
      if @entry.save
        format.js
      end
    end
    format.js

  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
      format.js
    end
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render action: 'show', status: :created, location: @task }
        format.js

      else
        format.html { render action: 'new' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
        format.js

      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :status)
    end
end
