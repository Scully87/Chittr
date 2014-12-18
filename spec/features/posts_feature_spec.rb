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

end