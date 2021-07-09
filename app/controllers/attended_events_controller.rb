class AttendedEventsController < ApplicationController
  def show
    event = Event.find(params[:event_id])
    @attend = AttendedEvent.where('event_id = ?', event.id)
  end

  def create
    event = Event.find(params[:event_id])
    unless user_signed_in?
      redirect_to new_user_session_path
      return
    end
    @attended_event = AttendedEvent.new(event_id: event.id, user_id: current_user.id)
    if AttendedEvent.where(user_id: current_user.id, event_id: params[:event_id]).exists?
      redirect_to event_path(event)
      return
    end
    if event.user_id == current_user.id
      redirect_to event_path(event)
      return
    end
    redirect_back(fallback_location: root_path) if @attended_event.save
  end
end
