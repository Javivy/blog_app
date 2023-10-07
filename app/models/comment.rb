class Comment < ActiveRecord::Base
  belongs_to :user, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  after_save :update_comments_counter

  private

  def update_comments_counter
    post.increment!(:comments_counter)
    post.save
  end

  validates :text, presence: true, length: { maximum: 250 }
end
