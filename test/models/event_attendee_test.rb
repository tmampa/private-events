require 'test_helper'

class EventAttendeeTest < ActiveSupport::TestCase
  test 'should have a event' do
    event = EventAttendee.new(event_id: 1)
    assert_not event.save, 'Event is missing'
  end

  test 'should have a attendee' do
    event = EventAttendee.new(attendee_id: 1)
    assert_not event.save, 'Attendee is missing'
  end

  test 'should have an event with a new attendee' do
    event = Event.first
    attendee = event.event_attendees.build(attendee_id: 1)
    assert_not attendee.save, 'Already attended to the event'
  end

  test 'should have a event and attendee' do
    event = Event.first
    user = User.create(name: 'Seba', email: 's@gmail.com', password: '131235')
    attendee = event.event_attendees.build(attendee_id: user.id)
    assert attendee.save, 'Attendee saved'
  end
end
