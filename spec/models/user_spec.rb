require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(
      name: 'Example User',
      posts_counter: 0
    )
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user = User.new(
      name: nil,
      posts_counter: 0
    )
    expect(user).not_to be_valid
  end

  it 'is not valid with a negative posts_counter' do
    user = User.new(
      name: 'Example User',
      posts_counter: -1
    )
    expect(user).not_to be_valid
  end

  it 'is valid with a non-negative posts_counter' do
    user = User.new(
      name: 'Example User',
      posts_counter: 0
    )
    expect(user).to be_valid
  end

  it 'has recent_posts' do
    user = User.create(
      name: 'Example User',
      posts_counter: 0
    )

    # Create some posts associated with the user

    # Call the recent_posts method
    recent_posts = user.recent_posts

    # Ensure that the recent_posts method returns an array of posts
    expect(recent_posts).to be_an(Array)
    expect(recent_posts.length).to eq(3)

    # Ensure that the posts are ordered by created_at in ascending order
    expect(recent_posts[0]).to eq(['Title 1', 'Text 1'])
    expect(recent_posts[1]).to eq(['Title 2', 'Text 2'])
    expect(recent_posts[2]).to eq(['Title 3', 'Text 3'])
  end
end
