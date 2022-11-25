class GuestSeat < ApplicationRecord
  belongs_to :guest, dependent: :destroy
  belongs_to :guest_table
end
