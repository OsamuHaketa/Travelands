class Post < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy

  has_many :tagmaps, dependent: :destroy
  has_many :tags, through: :tagmaps

  has_many :bookmarks, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_one_attached :post_image

  def get_post_image
    (post_image.attached?) ? post_image : 'no_image.png'
  end

  def save_tags(post_tags)
    current_tags = self.tags.pluck(:tagname) unless self.tags.nil?
    old_tags = current_tags - post_tags
    new_tags = post_tags - current_tags

    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(tagname: old_name)
    end

    new_tags.each do |new_name|
      post_tag = Tag.find_or_create_by(tagname: new_name)
      self.tags << post_tag
    end
  end

  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end

  def favorited_by?(user)
    favorites.where(user_id: user).exists?
  end

end
