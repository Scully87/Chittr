require 'rails_helper'

feature 'liking posts' do
  before do
    hello = Post.create(title: 'hello')
  end

  scenario 'a user can like a post, which updates the post like count' do
    visit '/posts'
    click_link 'Like'
    expect(page).to have_content("1 likes")
    save_and_open_page
  end

  it 'a user can like a post, which increments the like count', js: true do
	  visit '/posts'
	  click_link 'Like'
	  expect(page).to have_content("1 likes")
	end

end