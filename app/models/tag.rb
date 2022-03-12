class Tag < ApplicationRecord
  has_many :tagmaps, dependent: :destroy
  has_many :items, through: :tagmaps
end
