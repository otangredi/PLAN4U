class GuestTable < ApplicationRecord
  belongs_to :event, dependent: :destroy
  has_many :guest_seats
end
