class Like < ActiveRecord::Base
  belongs_to :author, class_name: 'user', foreign_key: 'users_id'
  belongs_to :post, class_name: 'post', foreign_key: 'posts_id'

  after_save :update_likes_counter

  private

  def update_likes_counter
    post.increment!(:likes_counter)
    post.save
  end
end
