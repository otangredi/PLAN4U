class Event < ApplicationRecord
  belongs_to :user
  has_many :guests, dependent: :destroy
  has_many :guest_tables, dependent: :destroy
  has_one :e_vite, dependent: :destroy
end
