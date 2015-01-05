module ApplicationHelper

  def sign_up
    visit('/')
    click_link('Sign up')
    fill_in('Name', with: 'Bob')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password (8 characters)', with: 'testtest')
    fill_in('Password Confirmation', with: 'testtest')
    attach_file('user[avatar]', 'spec/features/user.jpeg')
    click_button('Sign up')
  end

  def create_post
    visit '/posts/new'
    fill_in 'Description', with: 'Hello'
    click_button 'Create Post'
    expect(page).to have_content 'Hello'
  end

end