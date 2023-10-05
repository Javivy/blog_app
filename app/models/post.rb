class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User", foreign_key: 'authors_id'
  has_many :likes, class_name: "Like"
  has_many :comments, class_name: "Comment"

  def recent_comments
    Comment.where(posts_id: self.id).limit(5).order(created_at: :asc).pluck(:text)
  end

  def update_comments_counter
    post = self
    post.increment!(:comments_counter)
    post.save
  end

  def update_likes_counter
    post = self
    post.increment!(:likes_counter)
    post.save
  end
end