class Guest < ApplicationRecord
  belongs_to :event
  validates :status, presence: true

  enum status: {
    Pending: 0,
    Confirmed: 1,
    Denied: 2
  }, _prefix: true
end
