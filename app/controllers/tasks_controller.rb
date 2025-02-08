class TasksController < ApplicationController

  def index
    load_tasks
  end

  def show
    load_task
  end

  def new
    build_task
  end

  def create
    build_task

    if @task.save
      flash[:notice] = 'Task was successfully created'
      redirect_to @task
    else
      render 'new', status: :unprocessable_entity
    end  
  end

  def edit
    load_task
    build_task
  end

  def update
    load_task
    build_task

    if @task.save
      flash[:notice] = 'Task was successfully updated'
      redirect_to @task
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    load_task    
    
    @task.destroy!
    flash[:notice] = 'Task was successfully destroyed'
    redirect_to :tasks
  end

  private

  def load_tasks
    @tasks ||= task_scope.strict_loading.to_a
  end

  def load_task
    @task ||= task_scope.find(params[:id])
  end

  def build_task
    @task ||= task_scope.build
    @task.attributes = task_params
  end

  def task_params
    params.require(:task).permit(:description, :done)
  rescue ActionController::ParameterMissing  
    {}
  end

  def task_scope
    TasksForm.all
  end
end
