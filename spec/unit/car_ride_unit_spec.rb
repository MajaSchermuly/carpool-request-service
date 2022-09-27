# frozen_string_literal: true

# location: spec/unit/car_ride_unit_spec.rb
require 'rails_helper'

RSpec.describe CarRide, type: :model do
  subject do
    described_class.new(request_id: 1, driver_id: 1, queue_pos: 1)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a request_id' do
    subject.request_id = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a driver_id' do
    subject.driver_id = nil
    expect(subject).not_to be_valid
  end
end
