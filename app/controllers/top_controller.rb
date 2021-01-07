class TopController < ApplicationController
  before_action :set_events_diaries

  def index

    @monthly_target = MonthlyTarget.where(user_id: current_user.id)
    @weekly_target = WeeklyTarget.where(user_id: current_user.id)
    @daily_target = DailyTarget.where(user_id: current_user.id)
    @events = Event.where(user_id: current_user.id)
    @index_events = Event.where('start_time >= ?', Date.today).order('start_time ASC').limit(5)
    @index_diaries = Diary.where('start_time <= ?', Date.today).order('start_time ASC').limit(5)
    @tasks = current_user.tasks
  end

  private

  def set_events_diaries
  @index_events = Event.where('start_time >= ?', Date.today).order('start_time ASC').limit(5)
  @index_diaries = Diary.where('start_time <= ?', Date.today).order('start_time ASC').limit(5)
  end

end
