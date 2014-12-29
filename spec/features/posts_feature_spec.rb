require 'rails_helper'
require 'helpers/application'

include ApplicationHelper

feature 'posts' do

  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
    	sign_up
      visit '/posts'
      expect(page).to have_content 'Posts'
      expect(page).to have_link 'New Post'
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
	  	expect(page).not_to have_link 'New Post'
	  	expect(page).to have_content 'Sign in'
	  end
	end

	context 'editing posts' do
	  scenario 'lets a user edit a post they created' do
			sign_up
	    create_post
	    click_link 'Edit'
	    fill_in 'Description', with: 'GoodBye'
	    click_button 'Update Post'
	    expect(page).to have_content 'GoodBye'
	  end

	  scenario 'does not let a user edit a post they did not create' do
	  	visit '/posts'
	  	expect(page).not_to have_link 'Edit'
	  end
	end

	context 'deleting posts' do
	  scenario 'removes a post when a user clicks delete when signed in' do
	  	sign_up
	  	create_post
	    visit '/posts'
	    click_link 'Delete'
	    expect(page).not_to have_content 'Hello'
	  end

	  scenario 'does not let a user delete a post they did not create' do
	  	visit '/posts'
	  	expect(page).not_to have_link 'Delete'
	  end
	end

end