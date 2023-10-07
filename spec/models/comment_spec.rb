require 'rails_helper'

RSpec.describe Comment, type: :model do
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
    comment = Comment.new(
      text: 'Example Comment',
      user_id: user.id,
      post_id: post.id
    )
    expect(comment).to be_valid
  end

  it 'is not valid without text' do
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
    comment = Comment.new(
      text: nil,
      user_id: user.id,
      post_id: post.id
    )
    expect(comment).not_to be_valid
  end

  it 'increments the post\'s comments_counter after saving' do
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
    comment = Comment.create(
      text: 'Example Comment',
      user: user,
      post: post
    )

    expect(post.comments_counter).to eq(1)
  end
end
