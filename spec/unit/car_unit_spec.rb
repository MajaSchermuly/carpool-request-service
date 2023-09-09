# frozen_string_literal: true
# # frozen_string_literal: true
#
# # location: spec/unit/car_unit_spec.rb
# require 'rails_helper'
#
# RSpec.describe Car, type: :model do
#   subject do
#     described_class.create(make: 'Toyota', model: 'Camry', color: 'Red', plate_number: 'PZ65 BYV', registration_expiry: '2022/11/11')
#   end
#
#   it 'is valid with valid attributes' do
#     expect(subject).to be_valid
#   end
#
#   it 'is not valid without a make' do
#     subject.make = nil
#     expect(subject).not_to be_valid
#   end
#
#   it 'is not valid without a model' do
#     subject.model = nil
#     expect(subject).not_to be_valid
#   end
#
#   it 'is not valid without a color' do
#     subject.color = nil
#     expect(subject).not_to be_valid
#   end
#
#   # has issues with the upcase thing in model
#   # it 'is not valid without a plate number' do
#   #  subject.plate_number = nil
#   #  expect(subject).not_to be_valid
#   # end
#
#   it 'is not valid without a registration expiration date' do
#     subject.registration_expiry = nil
#     expect(subject).not_to be_valid
#   end
# end
