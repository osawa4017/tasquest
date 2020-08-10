class TasksController < ApplicationController
  before_action :authenticate_user!, only: [:main]

  def index
    @q = Task.ransack(params[:q])
    @tasks = @q.result(distinct: true)
    @maximum_per_page = 100

    if @tasks.length <= @maximum_per_page
      @results = @tasks.order("created_at DESC")
    else
      @results = @tasks.order("created_at DESC").page(params[:page]).per(@maximum_per_page)
    end
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
