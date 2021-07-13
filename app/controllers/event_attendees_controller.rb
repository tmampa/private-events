class EventAttendeesController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    attended = event.event_attendees.find_by(attendee_id: current_user.id)
    redirect_to event_path(event) and return if attended

    @event_attendee = event.event_attendees.build(attendee_id: current_user.id)
    redirect_to event_path(event) and return if @event_attendee.save

    redirect_to event_path(event)
  end
end
