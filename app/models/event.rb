class Event < ApplicationRecord
  belongs_to :user
  has_many :guests, dependent: :destroy
  has_many :guest_tables, dependent: :destroy
  has_one :e_vite, dependent: :destroy
  has_many :guest_choices, through: :guests
  validates :partner_first_name, :partner_last_name, :date, :venue, :name, presence: true
end
