class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.text :name
      t.string :photo
      t.text :bio
      t.integer :posts_counter, default: 0

      t.timestamps
    end
  end
end



