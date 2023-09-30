class Comment < ActiveRecord::Base
  belongs_to :users, class_name: "users", foreign_key: "users_id"
end