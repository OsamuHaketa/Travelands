class Tag < ApplicationRecord
  has_many :tagmaps
  has_many :posts, through: :tagmaps

  validates :tagname, length: { minimum: 1, maximum: 10 }
  
  def self.search(search)
    if search
      where(['tagname LIKE ?', "%#{search}%"])
    else
      all
    end
  end
  
end