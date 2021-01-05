class TargetsController < ApplicationController
  before_action :authenticate_user!

  def index
    # @user_target = UserTarget.find(params[:id])
    # @user_target = UserTarget.all
    @monthly_target = MonthlyTarget.all
    @weekly_target = WeeklyTarget.all
    @daily_target = DailyTarget.all
  end
  

  def new
    @user_target = UserTarget.new

  end
  
  def create
    # binding.pry
    @user_target = UserTarget.new(target_params)
    @user_target.save
    redirect_to targets_path
  end
  
  def edit
    @user_target = UserTarget.find(params[:id])
   
  end
  
  def update
    @user_target = UserTarget.find(params[:id])
    @user_target.update(target_params) 
    redirect_to targets_path
  end
  

  private

  def target_params
    params.require(:user_target).permit(:monthly_content, :weekly_content, :daily_content).merge(user_id: current_user.id, date: Date.today)
  end


end

