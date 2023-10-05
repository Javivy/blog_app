class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User", foreign_key: 'authors_id'
  has_many :likes, class_name: "Like"
  has_many :comments, class_name: "Comment"

  def update_counter(user)
    User.find(user).posts_counter += 1
  end

  # def recent_comments(post)
    
  # end
end