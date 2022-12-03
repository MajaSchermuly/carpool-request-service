# frozen_string_literal: true

# location: spec/feature/driver_integration_spec.rb
require 'rails_helper'

RSpec.describe 'Joining ndr as driver', type: :feature do
  scenario 'valid join' do
    visit new_whitelist_path
    fill_in 'Email', with: 'reb_pendra@gmail.com'
    click_on 'Create Whitelist'
    visit root_path
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
    check 'Start Now?'
    click_on 'Create Ndr'
    visit ndrs_path
    expect(page).to have_text('Active')
    # click_on 'Join'
    # click_on 'Confirm Sign-Up'
    # visit ndrs_path
    # expect(page).to have_content('Leave')
  end
end

RSpec.describe 'Leaving ndr as driver', type: :feature do
  scenario 'valid leave' do
    visit new_whitelist_path
    fill_in 'Email', with: 'reb_pendra@gmail.com'
    click_on 'Create Whitelist'
    visit root_path
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
    check 'Start Now?'
    click_on 'Create Ndr'
    visit ndrs_path
    expect(page).to have_text('Active')
    # click_on 'Join'
    # click_on 'Confirm Sign-Up'
    # visit ndrs_path
    # expect(page).to have_content('Leave')
  end
end
