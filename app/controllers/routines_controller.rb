class RoutinesController < ApplicationController
  before_action :set_routine, only: [:edit, :update, :destroy]
  before_action :prohibit_create_routine, only: [:new]

  def index
    @routines = Routine.where(user_id: current_user.id)
  end

  def new
    @routine = Routine.new
  end

  def create
    @routine = Routine.new(routine_params)
    
    if @routine.save
      render :create
      return
    else
      flash[:alert] = "ルーティンを追加できませんでした"
      redirect_to main_tasks_path
      return
    end
  end

  def edit
  end

  def update
    if @routine.update(routine_params)
      render :update
      return
    else
      flash[:alert] = "ルーティンを編集できませんでした"
      redirect_to main_tasks_path
      return
    end
  end

  def destroy
    if @routine.destroy
      render :destroy
      return
    else
      flash[:alert] = "ルーティンを編集できませんでした"
      redirect_to main_tasks_path
      return
    end
  end

  private

  def routine_params
    params.require(:routine).permit(:user_id, :content)
  end

  def set_routine
    @routine = Routine.find(params[:id])
  end

  def prohibit_create_routine
    @maximum_num = 5
    @routines = Routine.where(user_id: current_user.id)

    if @routines.length >= @maximum_num
      flash[:alert] = "作成できるルーティンの数は#{@maximum_num}個までです"
      redirect_to main_tasks_path
    else
      # nop
    end
  end
end
