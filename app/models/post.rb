class Post < ApplicationRecord
  has_many_attached :images
  belongs_to :user

  validates :images, presence: true
  has_many :likes, -> {order(:created_at => :desc)}
  has_many :comments, -> {order(:created_at => :desc)}
  has_many :bookmarks

  def is_belongs_to? user
    Post.find_by(user_id: user.id, id: id)
  end

  def is_liked user
    Like.find_by(user_id: user.id, post_id: id)
  end

  def is_bookmarked user
    Bookmark.find_by(user_id: user.id, post_id: id)
  end
end
