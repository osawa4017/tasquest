class TasksController < ApplicationController
  before_action :authenticate_user!, only: [:main]

  def index
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

  def main
    @routine_tasks = Task.where(classification_id: 1).order("created_at DESC").first(5)
    @todo_tasks    = Task.where(classification_id: 2).order("created_at DESC").first(5)
  end

  private

  def task_params
    params.require(:task).permit(:user_id, :classification_id, :content, :point, :deadline, :is_complete)
  end
end
