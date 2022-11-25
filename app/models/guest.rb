class Guest < ApplicationRecord
  belongs_to :event
  has_one :guest_seat
  has_many :guest_choices
  validates :status, presence: true

  enum status: {
    AwaitingResponse: 0,
    Attending: 1,
    NotAttending: 2
  }, _prefix: true
end
