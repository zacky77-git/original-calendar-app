class TargetsController < ApplicationController
  before_action :authenticate_user!

  def index
    # @monthly_target = MonthlyTarget.where(month_id: Date.today.month)
    # @weekly_target = WeeklyTarget.where(week_id: Date.today.cweek)
    # @daily_target = DailyTarget.where(date_id: Date.today)
    @monthly_target = MonthlyTarget.find_by(month_id: Date.today.month)
    @weekly_target = WeeklyTarget.find_by(week_id: Date.today.cweek)
    @daily_target = DailyTarget.find_by(date_id: Date.today)
  end
  

  def new
    @user_target = UserTarget.new

  end
  
  def create

    @user_target = UserTarget.new(target_params)
    @user_target.save
    redirect_to targets_path
  end
  
  def edit
 
    # @monthly_target = MonthlyTarget.where(month_id: Date.today.month)
    # @weekly_target = WeeklyTarget.where(week_id: Date.today.cweek)
    # @daily_target = DailyTarget.where(date_id: Date.today)
    @monthly_target = MonthlyTarget.find_by(month_id: Date.today.month)
    @weekly_target = WeeklyTarget.find_by(week_id: Date.today.cweek)
    @daily_target = DailyTarget.find_by(date_id: Date.today)
  end
  
  def update
    binding.pry
    # @user_target = UserTarget.find(params[:id])
    # @user_target.update(target_params) 
    
    # @monthly_target = MonthlyTarget.where(month_id: Date.today.month)
    # @weekly_target = WeeklyTarget.where(week_id: Date.today.cweek)
    # @daily_target = DailyTarget.where(date_id: Date.today)
    @monthly_target = MonthlyTarget.find_by(month_id: Date.today.month)
    @weekly_target = WeeklyTarget.find_by(week_id: Date.today.cweek)
    @daily_target = DailyTarget.find_by(date_id: Date.today)
    @monthly_target.update(target_params) 
    @weekly_target.update(target_params) 
    @daily_target.update(target_params) 
    redirect_to targets_path
  end
  

  private

  def target_params
    params.require(:user_target).permit(:monthly_content, :weekly_content, :daily_content).merge(user_id: current_user.id, date_id: Date.today, week_id: Date.today.cweek, month_id: Date.today.month)
  end


end

