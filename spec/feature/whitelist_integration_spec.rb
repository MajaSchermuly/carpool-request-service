# frozen_string_literal: true

# location: spec/feature/ndr_integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating an whitelist', type: :feature do
  before(:each) do
    visit new_member_session_path
    fill_in 'Email', with: 'testuser@gmail.com'
    fill_in 'Password', with: 'Change*Password'
    click_on 'LOGIN'
  end

  scenario 'valid inputs' do
    visit new_whitelist_path
    fill_in 'Email', with: 'reb_pendra@gmail.com'
    click_on 'Create Whitelist'
    visit whitelists_path
    expect(page).to have_content('reb_pendra@gmail.com')
  end

  scenario 'invalid inputs' do
    visit new_whitelist_path
    fill_in 'Email', with: ''
    click_on 'Create Whitelist'
    expect(page).to have_content('Email can\'t be blank')
  end
end

RSpec.describe 'Editing a whitelist', type: :feature do
  before(:each) do
    visit new_member_session_path
    fill_in 'Email', with: 'testuser@gmail.com'
    fill_in 'Password', with: 'Change*Password'
    click_on 'LOGIN'
    visit new_whitelist_path
    fill_in 'Email', with: 'reb_pendra@gmail.com'
    click_on 'Create Whitelist'
  end

  scenario 'update inputs' do
    visit edit_whitelist_path(Whitelist.find_by_email('reb_pendra@gmail.com'))
    fill_in 'Email', with: 'reb_pendragon@gmail.com'
    click_on 'Update Whitelist'
    visit whitelists_path
    expect(page).to have_content('reb_pendragon@gmail.com')
  end

  scenario 'update inputs, invalid email' do
    visit edit_whitelist_path(Whitelist.find_by_email('reb_pendra@gmail.com'))
    fill_in 'Email', with: ''
    click_on 'Update Whitelist'
    expect(page).to have_content('Email can\'t be blank')
  end
end

# Unable to test delete button due to being unable to specify which whitelist to remove
RSpec.describe 'Deleting a whitelist', type: :feature do
  scenario 'update inputs' do
    visit new_member_session_path
    fill_in 'Email', with: 'testuser@gmail.com'
    fill_in 'Password', with: 'Change*Password'
    click_on 'LOGIN'
    visit new_whitelist_path
    fill_in 'Email', with: 'reb_pendra@gmail.com'
    click_on 'Create Whitelist'
    expect(page).to have_content('reb_pendra@gmail.com')
    # visit whitelists_path
    # click_on 'Remove', match: :last
    # expect(page).not_to have_content('reb_pendra@gmail.com')
  end
end
