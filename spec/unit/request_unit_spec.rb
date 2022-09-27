# frozen_string_literal: true

# location: spec/unit/request_unit_spec.rb
require 'rails_helper'

RSpec.describe Request, type: :model do
  subject do
    described_class.new(rider_id: 1, date: '2022-08-18 22:09:00', pick_up_loc: '<Home address>',
                        drop_off_loc: '<School address?', num_passengers: 1, attire: 'Red shirt and black shorts', additional_info: 'N/A')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a rider_id' do
    subject.rider_id = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without an date and time' do
    subject.date = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a pick up location' do
    subject.pick_up_loc = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a drop off location' do
    subject.drop_off_loc = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a passenger count' do
    subject.num_passengers = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without an attire description' do
    subject.attire = nil
    expect(subject).not_to be_valid
  end
end
