class StatusesController < ApplicationController
  def new
    @status = Status.where(user_id: current_user.id)

    completes = Task.where(user_id: current_user.id, is_complete: true)
    @total_points = 0
    completes.each do |complete|
      @total_points = @total_points + complete.point
    end

    if @status.blank?
      @status = Status.new
    else
      redirect_to action: :edit, id: @status.ids
      return
    end
  end

  def create
    @status = Status.new(status_params)

    if @status.save
      flash[:notice] = "ステータスを編集しました"
    else
      flash[:alert] = "ステータスの編集に失敗しました"
    end

    redirect_to main_tasks_path
    return
  end

  def edit
    @status = Status.find(params[:id])

    completes = Task.where(user_id: current_user.id, is_complete: true)
    @total_points = 0
    completes.each do |complete|
      @total_points = @total_points + complete.point
    end

    if @status.blank?
      redirect_to action: new
      return
    else
      # nop
    end
  end

  def update
    @status = Status.find(params[:id])

    if @status.update(status_params)
      flash[:notice] = "ステータスを編集しました"
    else
      flash[:alert] = "ステータスの編集に失敗しました"
    end

    redirect_to main_tasks_path
    return
  end

  private
  
  def status_params
    params.require(:status).permit(:user_id, :heart, :attack, :defense)
  end
end
