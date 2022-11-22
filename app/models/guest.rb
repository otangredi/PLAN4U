class Guest < ApplicationRecord
  belongs_to :event
  validates :status, presence: true

  enum status: {
    Pending: 0,
    Attending: 1,
    Declined: 2
  }, _prefix: true
end
