class User < ApplicationRecord
  has_many :events
  has_many :attended_events
  has_many :attendances, through: :attended_events, source: :event

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_uniqueness_of :email, presence: true
  validates :password, presence: true
end
