class AddUserIdAndPostIdInLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :users, foreign_key: true, index: true
    add_reference :likes, :posts, foreign_key: true, index: true
  end
end
