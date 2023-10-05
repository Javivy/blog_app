class RenameColumnsInComment < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :users_id, :user_id
    rename_column :comments, :posts_id, :post_id
  end
end
