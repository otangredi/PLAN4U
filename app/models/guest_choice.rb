class GuestChoice < ApplicationRecord
  belongs_to :guest, dependent: :destroy
end
