class User < ActiveRecord::Base
  has_many :posts, class_name: 'Post', foreign_key: 'author_id'
  has_many :comments, class_name: 'Comment', foreign_key: 'user_id'
  has_many :likes, class_name: 'Like', foreign_key: 'user_id'

  def recent_posts
    posts.limit(3).order(created_at: :asc)
  end

  validates :name, presence: true
  validates :posts_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
