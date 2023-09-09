# frozen_string_literal: true
# # frozen_string_literal: true
#
# # location: spec/unit/request_unit_spec.rb
# require 'rails_helper'
#
# RSpec.describe Request, type: :model do
#   subject do
#     described_class.create(name: 'Ricardo', phone_number: '2105270414', pick_up_loc: '125 Spence Str, College Station, TX 77840', drop_off_loc: '719 S Rosemary Dr, Bryan, TX 77802', num_passengers: 1)
#   end
#
#   it 'is valid with valid attributes' do
#     expect(subject).to be_valid
#   end
#
#   it 'is not valid without a name' do
#     subject.name = nil
#     expect(subject).not_to be_valid
#   end
#
#   it 'is not valid without a phone number' do
#     subject.phone_number = nil
#     expect(subject).not_to be_valid
#   end
#
#   it 'is not valid without a pick up location' do
#     subject.pick_up_loc = nil
#     expect(subject).not_to be_valid
#   end
#
#   it 'is not valid without a drop off location' do
#     subject.drop_off_loc = nil
#     expect(subject).not_to be_valid
#   end
#
#   it 'is not valid without a number of passengers' do
#     subject.num_passengers = nil
#     expect(subject).not_to be_valid
#   end
# end
