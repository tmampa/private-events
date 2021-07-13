require 'rails_helper'
describe 'the signin process', type: :feature do
  it 'should have a event' do
    event = EventAttendee.new(event_id: 1)
    expect(event.save).to be(false)
  end

  it 'should have a attendee' do
    event = EventAttendee.new(attendee_id: 1)
    expect(event.save).to be(false)
  end

  it 'should have an event with a new attendee' do
    user = User.create(name: 'Seba', email: 's@gmail.com', password: '131235')
    event = Event.new(date: '2021-09-08', name: 'Event', creator_id: user.id)
    event.save
    attendee1 = Event.new(date: '2021-09-08', name: 'Event', creator_id: user.id)
    attendee1.save

    attendee2 = event.event_attendees.build(attendee_id: user.id)
    expect(attendee2.save).to be(true)
  end

  it 'should have a event and attendee' do
    user = User.create(name: 'Seba', email: 's@gmail.com', password: '131235')
    event = Event.new(date: '2021-09-08', name: 'Event', creator_id: user.id)
    event.save
    attendee = event.event_attendees.build(attendee_id: user.id)
    attendee.save
    expect(attendee.attendee_id).to eq(user.id)
  end
end
