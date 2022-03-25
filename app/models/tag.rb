class Tag < ApplicationRecord
  has_many :tagmaps
  has_many :posts, through: :tagmaps
end
