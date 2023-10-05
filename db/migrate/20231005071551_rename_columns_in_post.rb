class RenameColumnsInPost < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :authors_id, :author_id
  end
end
