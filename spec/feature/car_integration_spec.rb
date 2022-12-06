# frozen_string_literal: true

# location: spec/feature/car_integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a car', type: :feature do
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
    visit new_car_path
    fill_in 'Make', with: 'Toyota'
    fill_in 'Model', with: 'Camry'
    fill_in 'Color', with: 'Red'
    fill_in 'Plate number', with: 'PZ65 BYV'
    click_on 'Create Car'
    visit cars_path
    expect(page).to have_content('Toyota')
    expect(page).to have_content('Camry')
    expect(page).to have_content('Red')
    expect(page).to have_content('PZ65 BYV')
  end
end

RSpec.describe 'Updating a car', type: :feature do
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
    visit new_car_path
    fill_in 'Make', with: 'Toyota'
    fill_in 'Model', with: 'Camry'
    fill_in 'Color', with: 'Red'
    fill_in 'Plate number', with: 'PZ65 BYV'
    click_on 'Create Car'
  end

  scenario 'update inputs' do
    visit edit_car_path(Car.find_by_make('Toyota'))
    fill_in 'Plate number', with: 'PZ6S BYX'
    click_on 'Update Car'
    visit cars_path
    expect(page).to have_content('Toyota')
    expect(page).to have_content('Camry')
    expect(page).to have_content('Red')
    expect(page).to have_content('PZ6S BYX')
  end
end

RSpec.describe 'Deleting a car', type: :feature do
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
    visit new_car_path
    fill_in 'Make', with: 'Toyota'
    fill_in 'Model', with: 'Camry'
    fill_in 'Color', with: 'Red'
    fill_in 'Plate number', with: 'PZ65 BYV'
    click_on 'Create Car'
    visit cars_path
    expect(page).to have_content('Toyota')
    expect(page).to have_content('Camry')
    expect(page).to have_content('Red')
    expect(page).to have_content('PZ65 BYV')
    click_on 'Delete'
    expect(page).not_to have_content('Toyota')
    expect(page).not_to have_content('Camry')
    expect(page).not_to have_content('Red')
    expect(page).not_to have_content('PZ65 BYV')
  end
end
