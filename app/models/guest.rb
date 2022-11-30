class Guest < ApplicationRecord
  belongs_to :event
  has_one :guest_seat, dependent: :destroy
  has_one :guest_choice, dependent: :destroy
  validates :status, :name, :email, :relationship, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [ :name ],
    using: {
      tsearch: { prefix: true }
    }

  enum status: {
    "E-vite not sent": 0,
    "Awaiting Response": 1,
    "Attending": 2,
    "Not Attending": 3
  }, _prefix: true
end
