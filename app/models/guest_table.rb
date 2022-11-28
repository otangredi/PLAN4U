class GuestTable < ApplicationRecord
  belongs_to :event
  has_many :guest_seats, dependent: :destroy
end
