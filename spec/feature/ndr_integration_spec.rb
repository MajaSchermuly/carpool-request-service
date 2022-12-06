# frozen_string_literal: true

# location: spec/feature/ndr_integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating an ndr', type: :feature do
  before(:each) do
    visit new_member_session_path
    fill_in 'Email', with: 'testuser@gmail.com'
    fill_in 'Password', with: 'Change*Password'
    click_on 'LOGIN'
    visit new_whitelist_path
    fill_in 'Email', with: 'reb_pendra@gmail.com'
    click_on 'Create Whitelist'
    visit root_path
    click_on 'Logout', match: :first
    click_on 'Sign Up'
    fill_in 'First name', with: 'Rebecca'
    fill_in 'Last name', with: 'Pendragon'
    fill_in 'Email', with: 'reb_pendra@gmail.com'
    fill_in 'Phone', with: '7109290011'
    fill_in 'Emergency 1 full name', with: 'Lucy Pendragon'
    fill_in 'Emergency 1 phone number', with: '7109295223'
    fill_in 'Address', with: '<address>'
    fill_in 'Password', with: 'neone99'
    fill_in 'Password confirmation', with: 'neone99'
    click_on 'Sign up'
  end

  scenario 'valid inputs' do
    visit new_ndr_path
    select('12 AM', from: 'ndr_start_time_4i')
    select('11 PM', from: 'ndr_end_time_4i')
    select('59', from: 'ndr_end_time_5i')
    check 'Start Now?'
    click_on 'Create Ndr'
    visit ndrs_path
    expect(page).to have_content('Active')
  end
end

RSpec.describe 'Editing an ndr', type: :feature do
  before(:each) do
    visit new_member_session_path
    fill_in 'Email', with: 'testuser@gmail.com'
    fill_in 'Password', with: 'Change*Password'
    click_on 'LOGIN'
    visit new_whitelist_path
    fill_in 'Email', with: 'reb_pendra@gmail.com'
    click_on 'Create Whitelist'
    visit root_path
    click_on 'Logout', match: :first
    click_on 'Sign Up'
    fill_in 'First name', with: 'Rebecca'
    fill_in 'Last name', with: 'Pendragon'
    fill_in 'Email', with: 'reb_pendra@gmail.com'
    fill_in 'Phone', with: '7109290011'
    fill_in 'Emergency 1 full name', with: 'Lucy Pendragon'
    fill_in 'Emergency 1 phone number', with: '7109295223'
    fill_in 'Address', with: '<address>'
    fill_in 'Password', with: 'neone99'
    fill_in 'Password confirmation', with: 'neone99'
    click_on 'Sign up'
    visit new_ndr_path
    select('12 AM', from: 'ndr_start_time_4i')
    select('11 PM', from: 'ndr_end_time_4i')
    select('59', from: 'ndr_end_time_5i')
    check 'Start Now?'
    click_on 'Create Ndr'
  end

  scenario 'valid inputs' do
    visit edit_ndr_path(Ndr.find_by_is_active(true))
    fill_in 'How many members need to attend?', with: 3
    expect(page).to have_content(3)
  end
end

# unable to test the start and stop buttons of ndr (or delete)
