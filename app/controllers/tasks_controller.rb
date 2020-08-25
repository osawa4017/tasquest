class TasksController < ApplicationController
  before_action :authenticate_user!, only: [:main]
  before_action :set_task, only: [:edit, :update, :destroy]

  def index
    @routine_tasks = Task.where(user_id: current_user.id, classification_id: 1, deadline: Time.current.end_of_day).order("created_at DESC")

    @q = Task.where(user_id: current_user.id, classification_id: 2).ransack(params[:q])
    @q.sorts = 'created_at DESC' if @q.sorts.empty?
    @todo_tasks = @q.result(distinct: true)
    @maximum_per_page = 100

    if @todo_tasks.length <= @maximum_per_page
      @results = @todo_tasks
    else
      @results = @todo_tasks.page(params[:page]).per(@maximum_per_page)
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
      flash[:alert] = "タスクを追加できませんでした"
      redirect_to main_tasks_path
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
      flash[:alert] = "タスクを編集できませんでした"
      redirect_to main_tasks_path
      return
    end
  end

  def destroy
    if @task.destroy
      render :destroy
      return
    else
      flash[:alert] = "タスクを削除できませんでした"
      redirect_to main_tasks_path
      return
    end
  end

  def main
    @routine_tasks = Task.where(user_id: current_user.id, classification_id: 1, deadline: Time.current.end_of_day).order("created_at DESC")
    @todo_tasks    = Task.where(user_id: current_user.id, classification_id: 2).order("created_at DESC").first(5)
    completes      = Task.where(user_id: current_user.id, is_complete: true)
    @total_points = 0
    completes.each do |complete|
      @total_points = @total_points + complete.point
    end
    @level = (@total_points / 10) + 1
    @counter = 10 - (@total_points % 10)
  end

  private

  def task_params
    params.require(:task).permit(:user_id, :content, :classification_id, :point, :deadline, :is_complete)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
