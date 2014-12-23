require 'rails_helper'

feature 'liking posts' do
  before do
    hello = Post.create(title: 'hello')
  end

  scenario 'a user can like a post, which updates the post like count' do
    visit '/posts'
    click_link 'like'
    expect(page).to have_content('1 like')
  end

end