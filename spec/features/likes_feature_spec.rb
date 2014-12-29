require 'rails_helper'
require 'helpers/application'

include ApplicationHelper

feature 'liking posts' do

  context 'posts have been added' do
    scenario 'a user can like a post, which updates the post like count', js: true do
      sign_up
      create_post

      visit '/posts'
      click_link 'Like'
      expect(page).to have_content("1 likes")
    end
    scenario 'a user can like a post, which increments the like count', js: true do
  	  sign_up
      create_post
      visit '/posts'
  	  click_link 'Like'
  	  expect(page).to have_content("1 likes")
  	end
  end

end