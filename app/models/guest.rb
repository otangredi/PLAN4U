class Guest < ApplicationRecord
  belongs_to :event
  has_one :guest_seat
  has_one :guest_choice
  validates :status, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [ :name ],
    using: {
      tsearch: { prefix: true }
    }

  enum status: {
    Awaiting_Response: 0,
    Attending: 1,
    Not_Attending: 2
  }, _prefix: true
end
