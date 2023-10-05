class Comment < ActiveRecord::Base
  belongs_to :author, class_name: 'User', foreign_key: 'users_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'posts_id'

  after_save :update_comments_counter

  private

  def update_comments_counter
    post.increment!(:comments_counter)
    post.save
  end
end