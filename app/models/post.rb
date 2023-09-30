class Post < ActiveRecord::Base
  belongs_to :users, class_name: "users", foreign_key: "author_id"
end