class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]

  def index
    @events = Event.all
    # @diaries = Diary.all
    @index_events = Event.where('start_time >= ?', Date.today).order('start_time ASC').limit(5)
    #  @index_diaries = Diary.where("start_time <= ?",Date.today).order('start_time ASC').limit(5)
    @event = Event.new
  end

  def show; end

  def new
    @event = Event.new
  end

  def edit; end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  def update
    if @event.update(event_params)
      redirect_to events_url, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    redirect_to events_url, notice: 'Event was successfully destroyed.'
    # format.json { head :no_content }
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:title, :start_time, :end_time, :location).merge(user_id: current_user.id)
  end
end
