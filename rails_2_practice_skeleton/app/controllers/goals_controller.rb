class GoalsController < ApplicationController
  before_action :require_logged_in, only: [:new, :create]

  def new
    @goal = Goal.new
    render :new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = params[:user_id]
    if @goal.save
      redirect_to user_url(@goal.user_id)
    else
      flash[:errors] = @goal.errors.full_messages
      redirect_to user_url(@goal.user_id)
    end
  end

  def show
  end

  private

  def goal_params
    params.require(:goal).permit(:name, :details, :status, :user_id)
  end
end
