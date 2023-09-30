class Post < ActiveRecord::Base
  belongs_to :users, class_name: "users", foreign_key: "author_id"
  has_many :likes, class_name: "like", foreign_key: "reference_id"
end