# frozen_string_literal: true

# location: spec/feature/registration_integration_spec.rb
require 'rails_helper'

RSpec.describe 'Signing up with Form', type: :system do
  let(:email) { Faker::Internet.email }
  let(:password) { Faker::Internet.password(min_length: 6) }
  before do
    visit new_member_registration_path
  end
  #  scenario 'valid inputs' do
  #    visit new_whitelist_path
  #	fill_in 'Email', with: 'email'
  #    click_on 'Create Whitelist'
  #	visit new_member_registration_path
  #    fill_in 'member_first_name', with: 'Test'
  #    fill_in 'member_last_name', with: 'Phol'
  #    fill_in 'member_email', with: 'email'
  #    fill_in 'member_address', with: '2769 Eastern Blvd Montgomery, Alaska 36117'
  #    fill_in 'member_phone', with: '334-398-7387'
  #    fill_in 'member_emergency_1_full_name', with: 'John Phol'
  #    fill_in 'member_emergency_1_phone_number', with: '565-635-4563'
  #    fill_in 'member_password', with: password
  #    fill_in 'member_password_confirmation', with: password
  #    click_on 'Sign up'
  #    expect(page).to have_content('email')
  #  end
  scenario 'invalid password confirmation' do
    visit new_whitelist_path
    fill_in 'Email', with: 'giphane67764@imudutex.com'
    click_on 'Create Whitelist'
    visit new_member_registration_path
    fill_in 'member_first_name', with: 'Jilly'
    fill_in 'member_last_name', with: 'Phol'
    fill_in 'member_email', with: 'giphane67764@imudutex.com'
    fill_in 'member_address', with: '2769 Eastern Blvd Montgomery, Alaska 36117'
    fill_in 'member_phone', with: '334-398-7387'
    fill_in 'member_emergency_1_full_name', with: 'John Phol'
    fill_in 'member_emergency_1_phone_number', with: '334-396-2503'
    fill_in 'member_password', with: '123456'
    fill_in 'member_password_confirmation', with: '12345'
    click_on 'Sign up'
    expect(page).to have_content("Password confirmation doesn't match Password")
  end
  scenario 'Missing Field' do
    visit new_whitelist_path
    fill_in 'Email', with: 'gipafsfg67764@imdutex.com'
    click_on 'Create Whitelist'
    visit new_member_registration_path
    fill_in 'member_email', with: 'gipafsfg67764@imdutex.com'
    fill_in 'member_password', with: '123456'
    fill_in 'member_password_confirmation', with: '12345'
    click_on 'Sign up'
    expect(page).to have_content("can't be blank")
  end
  scenario 'Email already taken' do
    visit new_whitelist_path
    fill_in 'Email', with: 'jane.doe@hey.com'
    click_on 'Create Whitelist'
    visit new_member_registration_path
    @member1 = create :member
    fill_in 'member_first_name', with: 'Jilly'
    fill_in 'member_last_name', with: 'Phol'
    fill_in 'member_email', with: 'jane.doe@hey.com'
    fill_in 'member_password', with: '123456'
    fill_in 'member_password_confirmation', with: '123456'
    click_on 'Sign up'
    expect(page).to have_content('Email has already been taken')
  end
end

# RSpec.describe 'Update Registration', type: :system do
#  scenario 'valid inputs' do
#	visit new_member_registration_path
#    @member2 = create :member
#    sign_in @member2
#    visit edit_member_registration_path
#    fill_in 'member_first_name', with: 'Terri'
#    fill_in 'member_password', with: '123456'
#    fill_in 'member_password_confirmation', with: '123456'
#    fill_in 'member_current_password', with: @member2.password
#    click_on "Update"
#    #expect(page).to have_content('Terri')
#    @member2.reload
#    expect(@member2.first_name).to eq('Terri')
#  end
# end
