class Event < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :guests
  has_many :guest_tables
  has_one :e_vite
end
