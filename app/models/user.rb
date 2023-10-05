class User < ActiveRecord::Base
  has_many :posts, class_name: "post", foreign_key: "authors_id"
  has_many :comments, class_name: "comment", foreign_key: "comments_id"
  has_many :likes, class_name: "like", foreign_key: "likes_id"

  def recent_posts
    Post.where(authors_id: self.id).limit(3).order(created_at: :asc).pluck(:title, :text)
  end

  def update_counter
    user = self
    user.increment!(:posts_counter)
    user.save
  end
end

# first_comment = Comment.create(post: first_post, author: second_user, text: 'Hi Tom! 1' )
# second_comment = Comment.create(post: first_post, author: second_user, text: 'Hi Tom! 2' )
# third_comment = Comment.create(post: first_post, author: second_user, text: 'Hi Tom! 3' )
# fourth_comment = Comment.create(post: first_post, author: second_user, text: 'Hi Tom! 4' )
# fifth_comment = Comment.create(post: first_post, author: second_user, text: 'Hi Tom! 5' )
# sixth_comment = Comment.create(post: first_post, author: second_user, text: 'Hi Tom! 6' )