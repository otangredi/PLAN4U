class Guest < ApplicationRecord
  belongs_to :event
  has_one :guest_seat, dependent: :destroy
  has_one :guest_choice, dependent: :destroy
  validates :status, :name, :email, presence: true
  validates :relationship, presence: true, inclusion: { in: ["My Family", "Partner's Family", "My Friend", "Partner's Friend"] }

  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [ :name ],
    using: {
      tsearch: { prefix: true }
    }

  enum status: {
    "Not Sent": 0,
    "Awaiting Response": 1,
    "Attending": 2,
    "Not Attending": 3
  }, _prefix: true
end
