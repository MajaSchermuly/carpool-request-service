# # frozen_string_literal: true
# 
# # location: spec/unit/assignment_unit_spec.rb
# require 'rails_helper'
# 
# RSpec.describe Assignment, type: :model do
#   subject do
#     Request.create(request_id: 1, name: 'Ricardo', phone_number: '2105270414', pick_up_loc: '125 Spence Str, College Station, TX 77840', drop_off_loc: '719 S Rosemary Dr, Bryan, TX 77802', num_passengers: 1)
#     Car.create(car_id: 1, make: 'Toyota', model: 'Camry', color: 'Red', plate_number: 'PZ65 BYV', registration_expiry: '2022/11/11')
#     described_class.create(request_id: 1, car_id: 1)
#   end
# 
#   it 'is valid with valid attributes' do
#     expect(subject).to be_valid
#   end
# 
#   it 'is not valid without a request' do
#     subject.request_id = nil
#     expect(subject).not_to be_valid
#   end
# 
#   it 'is not valid without a car' do
#     subject.car_id = nil
#     expect(subject).not_to be_valid
#   end
# end
