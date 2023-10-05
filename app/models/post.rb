class Post < ActiveRecord::Base
  belongs_to :author, class_name: 'User', foreign_key: 'authors_id'
  has_many :likes, class_name: 'Like'
  has_many :comments, class_name: 'Comment'

  def recent_comments
    Comment.where(posts_id: id).limit(5).order(created_at: :asc).pluck(:text)
  end

  after_save :update_posts_counter

  private
  def update_posts_counter
    author.increment!(:posts_counter)
    author.save
  end
end
