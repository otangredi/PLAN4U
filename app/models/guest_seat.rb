class GuestSeat < ApplicationRecord
  belongs_to :guest
  belongs_to :guest_table
end
