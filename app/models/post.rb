class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User", foreign_key: 'authors_id'
  has_many :likes, class_name: "Like"
  has_many :comments, class_name: "Comment"

  # def recent_comments(post)

  # end
end