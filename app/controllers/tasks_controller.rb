class TasksController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @routine_tasks = Task.where(classification_id: 1).order("created_at DESC").first(5)
    @todo_tasks    = Task.where(classification_id: 2).order("created_at DESC").first(5)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    
    if @task.save
      render :create
      return
    else
      render :new
      return
    end
  end

  private

  def task_params
    params.require(:task).permit(:user_id, :classification_id, :content, :point, :deadline, :is_complete)
  end
end
