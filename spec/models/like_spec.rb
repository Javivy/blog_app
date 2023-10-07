require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(
      name: 'Example User',
      posts_counter: 0
    )
    post = Post.create(
      title: 'Example Post',
      comments_counter: 0,
      likes_counter: 0,
      author_id: user.id
    )
    like = Like.new(
      user_id: user.id,
      post_id: post.id
    )
    expect(like).to be_valid
  end

  it 'increments the post\'s likes_counter after saving' do
    user = User.create(
      name: 'Example User',
      posts_counter: 0
    )
    post = Post.create(
      title: 'Example Post',
      text: 'Hello',
      comments_counter: 0,
      likes_counter: 0,
      author: user
    )
    Like.create(
      user:,
      post:
    )

    expect(post.likes_counter).to eq(1)
  end
end
