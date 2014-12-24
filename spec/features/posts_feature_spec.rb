require 'rails_helper'

	def sign_up
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end

feature 'posts' do

  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'Posts'
      expect(page).to have_link 'New'
    end
  end

  context 'posts have been added' do
  	before {Post.create title: 'Hello'}

	  scenario 'display posts' do
	  	visit '/posts'
	  	expect(page).to have_content 'Hello'
	  end
	end

	context 'creating posts' do
		scenario 'prompts user to fill out a form, then displays the new post' do
			visit '/posts'
			sign_up
			click_link 'New'
			fill_in 'Title', with: 'Hello'
			click_button 'Create Post'
			expect(page).to have_content 'Hello'
		end
	end

	context 'editing posts' do

	  scenario 'let a user edit a post' do
			sign_up
	    visit '/posts'
	    click_link 'New'
			fill_in 'Title', with: 'Hello'
			click_button 'Create Post'
			expect(page).to have_content 'Hello'
	    click_link 'Edit'
	    save_and_open_page
	    fill_in 'Title', with: 'GoodBye'
	    click_button 'Update Post'
	    expect(page).to have_content 'GoodBye'
	  end
	end

	context 'deleting posts' do
	  before {Post.create title: 'Hello'}

	  scenario 'removes a post when a user clicks a delete link' do
	    visit '/posts'
	    click_link 'Delete'
	    expect(page).not_to have_content 'Hello'
	  end
	end

end