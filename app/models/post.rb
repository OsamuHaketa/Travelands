class Post < ApplicationRecord
  belongs_to :user
  has_many :post_comments

  has_one_attached :post_image

  def get_post_image
    (post_image.attached?) ? post_image : 'no_image.png'
  end
end