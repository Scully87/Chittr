require 'rails_helper'
require 'helpers/application'

include ApplicationHelper

feature 'posts' do

  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'Posts'
      expect(page).to have_link 'New'
    end
  end

  context 'posts have now been added' do
	  scenario 'should display the feed of posts' do
	  	sign_up
	  	create_post
	  	visit '/posts'
	  	expect(page).to have_content 'Hello'
	  end
	end

	context 'creating posts' do
		scenario 'prompts user to fill out a form, then displays the new post' do
			visit '/posts'
			sign_up
			create_post
		end

		scenario 'does not let a user create a post unless signed in' do
	  	visit '/posts'
	  	click_link 'New'
	  	expect(page).to have_content 'Log in'
	  end
	end

	context 'editing posts' do
	  scenario 'let a user edit a post if singed in' do
			sign_up
	    create_post
	    click_link 'Edit'
	    fill_in 'Title', with: 'GoodBye'
	    click_button 'Update Post'
	    expect(page).to have_content 'GoodBye'
	  end

	  scenario 'does not let a different user edit a post' do
	  	visit '/posts'
	  	expect(page).not_to have_link 'Edit'
	  end
	end

	context 'deleting posts' do
	  scenario 'removes a post when a user clicks a delete link  a post if signed in' do
	  	sign_up
	  	create_post
	    visit '/posts'
	    click_link 'Delete'
	    expect(page).not_to have_content 'Hello'
	  end

	  scenario 'does not let a different user delete' do
	  	visit '/posts'
	  	expect(page).not_to have_link 'Delete'
	  end
	end

end