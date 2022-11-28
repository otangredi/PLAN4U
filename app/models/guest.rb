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
    Awaiting_Response: 0,
    Attending: 1,
    Not_Attending: 2
  }, _prefix: true
end
