class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, foreign_key: 'creator_id', class_name: 'Event'
  has_many :event_attendees, foreign_key: 'attendee_id'
  has_many :attending_events, through: :event_attendees, source: :event

  validates :name, presence: true
end
