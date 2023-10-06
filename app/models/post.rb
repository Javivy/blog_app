class Post < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  has_many :likes, class_name: 'Like', foreign_key: 'post_id'
  has_many :comments, class_name: 'Comment', foreign_key: 'post_id'

  def recent_comments
    comments.limit(5).order(created_at: :asc).pluck(:text)
  end

  after_save :update_posts_counter

  private

  def update_posts_counter
    author.increment!(:posts_counter)
    author.save
  end

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, presence: true, only_integer: true, greater_than_or_equal_to: 0
end
