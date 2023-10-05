class Like < ActiveRecord::Base
  belongs_to :user, class_name: 'user', foreign_key: 'user_id'
  belongs_to :post, class_name: 'post', foreign_key: 'post_id'
end
