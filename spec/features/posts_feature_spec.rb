require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'Posts'
      expect(page).to have_link 'New'
    end
  end

  context 'posts have been added' do
  	before do
  		Post.create(title: 'Hello')
  	end

	  scenario 'display posts' do
	  	visit '/posts'
	  	expect(page).to have_content('Hello')
	  end
	end

	context 'creating posts' do
		scenario 'prompts user to fill out a form, then displays the new post' do
			visit '/posts'
			click_link 'New'
			fill_in 'Title', with: 'Hello'
			click_button 'Create Post'
			expect(page).to have_content 'Hello'
		end
	end

	context 'editing posts' do

  before {Post.create title: 'Hello'}

	  scenario 'let a user edit a post' do
	    visit '/posts'
	    click_link 'Edit'
	    fill_in 'Title', with: 'Good-Bye'
	    click_button 'Update Post'
	    expect(page).to have_content 'Good-Bye'
	  end
	end

end