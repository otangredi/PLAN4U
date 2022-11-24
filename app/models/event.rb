class Event < ApplicationRecord
  belongs_to :user
  has_many :guests
  has_many :guest_tables
  validates_uniqueness_of :name, case_sensitive: false
end
