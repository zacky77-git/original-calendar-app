class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_events_diaries
  
  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def set_events_diaries
    @index_events = Event.where('start_time >= ?', Date.today).order('start_time ASC').limit(5)
    @index_diaries = Diary.where('start_time <= ?', Date.today).order('start_time ASC').limit(5)
    end
end
