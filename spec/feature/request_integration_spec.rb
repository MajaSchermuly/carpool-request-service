# frozen_string_literal: true

# location: spec/feature/request_integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a request', type: :feature do
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
    visit requests_incoming_path
    fill_in 'Name:', with: 'Ricardo'
    fill_in 'Phone Number:', with: '2105270414'
    fill_in 'Pick Up Location:', with: '125 Spence Str, College Station, TX 77840'
    fill_in 'Drop Off Location:', with: '719 S Rosemary Dr, Bryan, TX 77802'
    fill_in 'Number of Passengers:', with: 3
    click_on 'Create Request'
    visit requests_waiting_path
    expect(page).to have_content('Ricardo')
    expect(page).to have_content('2105270414')
    expect(page).to have_content('125 Spence Str, College Station, TX 77840')
    expect(page).to have_content('719 S Rosemary Dr, Bryan, TX 77802')
    expect(page).to have_content('3')
  end
end

RSpec.describe 'Updating a request', type: :feature do
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
    visit requests_incoming_path
    fill_in 'Name:', with: 'Ricardo'
    fill_in 'Phone Number:', with: '2105270414'
    fill_in 'Pick Up Location:', with: '125 Spence Str, College Station, TX 77840'
    fill_in 'Drop Off Location:', with: '719 S Rosemary Dr, Bryan, TX 77802'
    fill_in 'Number of Passengers:', with: 3
    click_on 'Create Request'
  end

  scenario 'update inputs' do
    visit edit_request_path(Request.find_by_phone_number('2105270414'))
    fill_in 'Pick Up Location:', with: '676 Lubbock St, College Station, TX 77840'
    fill_in 'Number of Passengers:', with: 2
    click_on 'Update Request'
    visit requests_waiting_path
    expect(page).to have_content('Ricardo')
    expect(page).to have_content('2105270414')
    expect(page).to have_content('676 Lubbock St, College Station, TX 77840')
    expect(page).to have_content('719 S Rosemary Dr, Bryan, TX 77802')
    expect(page).to have_content('2')
  end
end

RSpec.describe 'Canceling a request', type: :feature do
  scenario 'cancel inputs' do
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
    visit requests_incoming_path
    fill_in 'Name:', with: 'Ricardo'
    fill_in 'Phone Number:', with: '2105270414'
    fill_in 'Pick Up Location:', with: '125 Spence Str, College Station, TX 77840'
    fill_in 'Drop Off Location:', with: '719 S Rosemary Dr, Bryan, TX 77802'
    fill_in 'Number of Passengers:', with: 3
    click_on 'Create Request'
    visit requests_waiting_path
    expect(page).to have_content('Ricardo')
    expect(page).to have_content('2105270414')
    expect(page).to have_content('125 Spence Str, College Station, TX 77840')
    expect(page).to have_content('719 S Rosemary Dr, Bryan, TX 77802')
    expect(page).to have_content('3')
    click_on 'Cancel'
    visit assignments_done_path
    expect(page).to have_content('Cancelled')
    expect(page).to have_content('Ricardo')
    expect(page).to have_content('2105270414')
    expect(page).to have_content('125 Spence Str, College Station, TX 77840')
    expect(page).to have_content('719 S Rosemary Dr, Bryan, TX 77802')
    expect(page).to have_content('Cancelled')
  end
end

RSpec.describe 'Deleting a request', type: :feature do
  scenario 'delete inputs' do
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
    visit requests_incoming_path
    fill_in 'Name:', with: 'Ricardo'
    fill_in 'Phone Number:', with: '2105270414'
    fill_in 'Pick Up Location:', with: '125 Spence Str, College Station, TX 77840'
    fill_in 'Drop Off Location:', with: '719 S Rosemary Dr, Bryan, TX 77802'
    fill_in 'Number of Passengers:', with: 3
    click_on 'Create Request'
    visit requests_waiting_path
    expect(page).to have_content('Ricardo')
    expect(page).to have_content('2105270414')
    expect(page).to have_content('125 Spence Str, College Station, TX 77840')
    expect(page).to have_content('719 S Rosemary Dr, Bryan, TX 77802')
    expect(page).to have_content('3')
    visit requests_path
    click_on 'Destroy'
    expect(page).not_to have_content('Ricardo')
    expect(page).not_to have_content('2105270414')
    expect(page).not_to have_content('125 Spence Str, College Station, TX 77840')
    expect(page).not_to have_content('719 S Rosemary Dr, Bryan, TX 77802')
    expect(page).not_to have_content('3')
  end
end
