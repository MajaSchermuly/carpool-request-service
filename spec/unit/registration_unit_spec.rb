# # frozen_string_literal: true
# 
# # location: spec/unit/registration_unit_spec.rb
# require 'rails_helper'
# 
# RSpec.describe Member, type: :model do
#   subject do
#     Whitelist.create(email: 'adjdhflkajhsd@gjalsdm.com')
#     Member.create!(first_name: 'TestName', last_name: 'TestName', phone: '832-461-6853', address: '987239yr8', emergency_1_phone_number: '8578575843', emergency_1_full_name: 'TestName', email: 'adjdhflkajhsd@gjalsdm.com', password: '123456', password_confirmation: '123456')
#   end
# 
#   it 'is valid with valid attributes' do
#     expect(subject).to be_valid
#   end
# 
#   it 'is not valid without a first_name' do
#     subject.first_name = nil
#     expect(subject).not_to be_valid
#   end
# 
#   it 'is not valid without a last name' do
#     subject.last_name = nil
#     expect(subject).not_to be_valid
#   end
# 
#   it 'is not valid without an address' do
#     subject.address = nil
#     expect(subject).not_to be_valid
#   end
# end
