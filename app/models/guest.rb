class Guest < ApplicationRecord
  belongs_to :event
  validates :status, presence: true

  enum status: {
    Awaiting_Response: 0,
    Attending: 1,
    Not_Attending: 2
  }, _prefix: true
end
