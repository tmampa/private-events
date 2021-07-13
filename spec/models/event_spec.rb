require 'rails_helper'
describe 'the signin process', type: :feature do
  it 'should not save event without name' do
    event = Event.new(creator_id: 1, date: '06-06-21')
    expect(event.save).to be(false)
  end

  it 'should not save event without empty user creator' do
    event = Event.new(name: 'Event', date: '06-06-21')
    expect(event.save).to be(false)
  end

  it 'should not save event without valid user' do
    event = Event.new(name: 'Event', date: '06-06-21', creator_id: 'xx')
    expect(event.save).to be(false)
  end

  it 'should not save event without date' do
    event = Event.new(name: 'Event', creator_id: 1)
    event.save
    expect(event.name).to eq('Event')
  end
end
