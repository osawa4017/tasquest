class TasksController < ApplicationController
  before_action :authenticate_user!, only: [:main]
  before_action :set_task, only: [:edit, :update, :destroy]

  def index
    @q = Task.ransack(params[:q])
    @q.sorts = 'created_at DESC' if @q.sorts.empty?
    @tasks = @q.result(distinct: true)
    @maximum_per_page = 100

    if @tasks.length <= @maximum_per_page
      @results = @tasks
    else
      @results = @tasks.page(params[:page]).per(@maximum_per_page)
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

  def edit
  end

  def update
    if @task.update(task_params)
      render :update
      return
    else
      render :edit
      return
    end
  end

  def destroy
    @task.destroy
  end

  def main
    @routine_tasks = Task.where(classification_id: 1).order("created_at DESC").first(5)
    @todo_tasks    = Task.where(classification_id: 2).order("created_at DESC").first(5)
  end

  private

  def task_params
    params.require(:task).permit(:user_id, :classification_id, :content, :point, :deadline, :is_complete)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
