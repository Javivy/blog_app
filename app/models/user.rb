class User < ActiveRecord::Base
  has_many :posts, class_name: 'post', foreign_key: 'authors_id'
  has_many :comments, class_name: 'comment', foreign_key: 'authors_id'
  has_many :likes, class_name: 'like', foreign_key: 'authors_id'

  def recent_posts
    Post.where(authors_id: id).limit(3).order(created_at: :asc).pluck(:title, :text)
  end
end
