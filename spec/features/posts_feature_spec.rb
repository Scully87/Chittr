require 'rails_helper'

	def sign_up
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end

  def create_post
  	visit '/posts'
	  click_link 'New'
		fill_in 'Title', with: 'Hello'
		click_button 'Create Post'
		expect(page).to have_content 'Hello'
  end

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
	end

	context 'editing posts' do
	  scenario 'let a user edit a post' do
			sign_up
	    create_post
	    click_link 'Edit'
	    fill_in 'Title', with: 'GoodBye'
	    click_button 'Update Post'
	    expect(page).to have_content 'GoodBye'
	  end
	end

	context 'deleting posts' do
	  scenario 'removes a post when a user clicks a delete link' do
	  	sign_up
	  	create_post
	    visit '/posts'
	    click_link 'Delete'
	    expect(page).not_to have_content 'Hello'
	  end
	end

end