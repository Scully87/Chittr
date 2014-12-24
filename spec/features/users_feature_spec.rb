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

end