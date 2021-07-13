class AttendedEventController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    attended = event.attended_event.find_by(attendee_id: current_user.id)
    redirect_to event_path(event) and return if attended

    @attended_event = event.attended_event.build(attendee_id: current_user.id)
    redirect_to event_path(event) and return if @attended_event.save

    redirect_to event_path(event)
  end
end

