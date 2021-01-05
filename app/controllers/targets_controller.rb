class TargetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @monthly_target = MonthlyTarget.all
    @weekly_target = WeeklyTarget.all
    @daily_target = DailyTarget.all
  end
  

  def new
    @user_target = UserTarget.new
    # @monthly_target = MonthlyTarget.new
    # @weekly_target = WeeklyTarget.new
    # @daily_target = DailyTarget.new
  end
  
  def create
    # binding.pry
    @user_target = UserTarget.new(target_params)
    @user_target.save
    # @monthly_target = MonthlyTarget.new(monthly_target_params)
    # @weekly_target = WeeklyTarget.new(weekly_target_params)
    # @daily_target = DailyTarget.new(daily_target_params)
    # @monthly_target.save! || @weekly_target.save! || @daily_target.save!
    redirect_to root_path
  end
  
  def edit
    @monthly_target = MonthlyTarget.find(params[:id])
    @weekly_target = WeeklyTarget.find(params[:id])
    @daily_target = DailyTarget.find(params[:id])
  end
  
  def update
    @monthly_target = MonthlyTarget.find(params[:id])
    @weekly_target = WeeklyTarget.find(params[:id])
    @daily_target = DailyTarget.find(params[:id])
    @monthly_target.update(monthly_target_params) || @weekly_target.update(weekly_target_params) || @daily_target.update(daily_target_params)
    redirect_to root_path
  end
  
  def destroy
    @monthly_target = MonthlyTarget.find(params[:id])
    @weekly_target = WeeklyTarget.find(params[:id])
    @daily_target = DailyTarget.find(params[:id])
    @monthly_target.destroy || @weekly_target.destroy || @daily_target.destroy
    redirect_to root_path
  end
  
  private

  def target_params
    params.require(:user_target).permit(:monthly_content, :weekly_content, :daily_content)
  end

  def monthly_target_params
    # params.require(:monthly_target).permit(:monthly_content)
  end

  def weekly_target_params
    # params.require(:weekly_target).permit(:weekly_content)
  end

  def daily_target_params
    # params.require(:daily_target).permit(:daily_content)
  end

end

