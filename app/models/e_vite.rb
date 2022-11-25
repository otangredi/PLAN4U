class EVite < ApplicationRecord
  belongs_to :event, dependent: :destroy
end
