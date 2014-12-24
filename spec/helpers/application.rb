module ApplicationHelper

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

end