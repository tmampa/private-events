class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  scope :past, -> { where('date < ?', DateTime.now) }
  scope :upcoming, -> { where('date > ?', DateTime.now) }

  has_many :event_attendees, foreign_key: 'event_id'
  has_many :attendees, through: :event_attendees, source: :attendee
end
