require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test 'should not save event without name' do
    event = Event.new(creator_id: 1, date: '06-06-21')
    assert_not event.save, 'Event name is missing'
  end

  test 'should not save event without empty user creator' do
    event = Event.new(name: 'Event', date: '06-06-21')
    assert_not event.save, 'User creator name is missing'
  end

  test 'should not save event without valid user' do
    event = Event.new(name: 'Event', date: '06-06-21', creator_id: 'xx')
    assert_not event.save, 'Wrong creator user given'
  end

  test 'should not save event without date' do
    event = Event.new(name: 'Event', creator_id: 1)
    assert_not event.save, 'Date is missing'
  end
end
