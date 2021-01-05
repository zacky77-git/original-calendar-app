class TopController < ApplicationController
  def index
    # @monthly_targets = MonthlyTarget.where(date: "2021-01-05")

    # @monthly_target = MonthlyTarget.where(user_id: :current_user.id )
    @monthly_target = MonthlyTarget.where(user_id: current_user.id)
    # binding.pry
    @weekly_target = WeeklyTarget.where(user_id: current_user.id)
    @daily_target = DailyTarget.where(user_id: current_user.id)
    @events = Event.where(user_id: current_user.id)
 
    # @monthly_target = MonthlyTarget.all
    # @weekly_target = WeeklyTarget.all
    # @daily_target = DailyTarget.all
    # @events = Event.all
    @index_events = Event.where('start_time >= ?', Date.today).order('start_time ASC').limit(5)
    @index_diaries = Diary.where('start_time <= ?', Date.today).order('start_time ASC').limit(5)
    @tasks = current_user.tasks
  end
end
