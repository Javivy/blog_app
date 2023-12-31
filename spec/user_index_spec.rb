require 'rails_helper'

RSpec.describe 'User Index Page', type: :feature do
  it 'displays user information' do
    user1 = User.create(
      name: 'Masuma',
      photo: 'https://avatars.githubusercontent.com/u/112550568?v=4',
      bio: 'Software Engineer',
      posts_counter: 6
    )
    user2 = User.create(
      name: 'Javier',
      photo: 'https://avatars.githubusercontent.com/u/109859994?v=4',
      bio: 'Full-Stack Developer',
      posts_counter: 0
    )
    visit users_path
    expect(page).to have_content(user1.name)
    expect(page).to have_selector("img[src*='#{user1.photo}']")
    expect(page).to have_content("Number of Posts: #{user1.posts.count}")
    expect(page).to have_link(user1.name, href: user_path(user1))
    expect(page).to have_content(user2.name)
    expect(page).to have_selector("img[src*='#{user2.photo}']")
    expect(page).to have_content("Number of Posts: #{user2.posts.count}")
    expect(page).to have_link(user2.name, href: user_path(user2))
  end
end
