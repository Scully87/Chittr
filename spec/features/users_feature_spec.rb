require 'rails_helper'
require 'helpers/application'

include ApplicationHelper

feature 'users' do

  context "not signed in and on the homepage" do
    scenario "should see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end
    scenario "should not see 'sign out' link" do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end
  end

  context "signed in on the homepage" do
    scenario "should see 'sign out' link" do
      sign_up
      visit('/')
      expect(page).to have_link('Sign out')
    end
    scenario "should not see a 'sign in' link and a 'sign up' link" do
      sign_up
      visit('/')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
  end

  context "must upload avatar when signing up" do
    scenario "successfully sign up with avatar" do
      visit('/')
      click_link('Sign up')
      fill_in('Name', with: 'Bob')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password (8 characters)', with: 'testtest')
      fill_in('Password Confirmation', with: 'testtest')
      attach_file('user[avatar]', 'spec/features/user.jpeg')
      click_button('Sign up')
      expect(current_path).to eq '/'
    end
    xscenario "unable to sign up becasuse no avatar has been uploaded" do
      visit('/')
      click_link('Sign up')
      fill_in('Name', with: 'Bob')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password (8 characters)', with: 'testtest')
      fill_in('Password Confirmation', with: 'testtest')
      click_button('Sign up')
      save_and_open_page
      expect(current_path).to eq '/users/sign_up'
    end
  end

end