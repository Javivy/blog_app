require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'is valid with valid attributes' do
    author = User.new(
      name: 'Example User',
      posts_counter: 0
    )
    post = Post.new(
      title: 'Example Post',
      text: 'Hello',
      author: author,
      comments_counter: 0,
      likes_counter: 0
    )
    expect(post).to be_valid
  end

  it 'is not valid without a title' do
    author = User.new(
      name: 'Example User',
      posts_counter: 0
    )
    post = Post.new(
      title: nil,
      text: 'Hello',
      author: author,
      comments_counter: 0,
      likes_counter: 0
    )
    expect(post).not_to be_valid
  end

  it 'is not valid with a long title' do
    post = Post.new(
      title: 'a' * 251,
      comments_counter: 0,
      likes_counter: 0
    )
    expect(post).not_to be_valid
  end

  it 'is not valid with a negative comments_counter' do
    post = Post.new(
      title: 'Example Post',
      comments_counter: -1,
      likes_counter: 0
    )
    expect(post).not_to be_valid
  end

  it 'is not valid with a negative likes_counter' do
    post = Post.new(
      title: 'Example Post',
      comments_counter: 0,
      likes_counter: -1
    )
    expect(post).not_to be_valid
  end

  it 'is valid with a non-negative comments_counter' do
    author = User.new(
      name: 'Example User',
      posts_counter: 0
    )
    post = Post.new(
      title: 'Example Post',
      text: 'Hello',
      author: author,
      comments_counter: 0,
      likes_counter: 0
    )
    expect(post).to be_valid
  end

  it 'is valid with a non-negative likes_counter' do
    author = User.new(
      name: 'Example User',
      posts_counter: 0
    )
    post = Post.new(
      title: 'Example Post',
      text: 'Hello',
      author: author,
      comments_counter: 0,
      likes_counter: 0
    )
    expect(post).to be_valid
  end

  it 'has recent_comments' do
    author = User.new(
      name: 'Example User',
      posts_counter: 0
    )
    post = Post.new(
      title: 'Example Post',
      text: 'Hello',
      author: author,
      comments_counter: 0,
      likes_counter: 0
    )

    post.save

    # Create some comments associated with the post
    comments = [
      post.comments.create(text: 'Comment 1', user: author, post: post),
      post.comments.create(text: 'Comment 2', user: author, post: post),
      post.comments.create(text: 'Comment 3', user: author, post: post),
      post.comments.create(text: 'Comment 4', user: author, post: post),
      post.comments.create(text: 'Comment 5', user: author, post: post)
    ]

    # Call the recent_comments method
    recent_comments = post.recent_comments

    # Ensure that the recent_comments method returns an array of comment texts
    expect(recent_comments).to be_an(Array)
    expect(recent_comments.length).to eq(5)

    # Ensure that the comments are ordered by created_at in ascending order
    expect(recent_comments[0]).to eq('Comment 1')
    expect(recent_comments[1]).to eq('Comment 2')
    expect(recent_comments[2]).to eq('Comment 3')
  end

  it 'increments the author\'s posts_counter after saving' do
    author = User.new(
      name: 'Example User',
      posts_counter: 0
    )
    post = Post.new(
      title: 'Example Post',
      text: 'Hello',
      author: author,
      comments_counter: 0,
      likes_counter: 0
    )

    post.save

    expect(author.posts_counter).to eq(1)
  end
end
