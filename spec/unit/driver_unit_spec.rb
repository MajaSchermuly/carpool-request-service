# frozen_string_literal: true

# location: spec/unit/driver_unit_spec.rb
require 'rails_helper'

RSpec.describe Driver, type: :model do
  subject do
    described_class.new(phone_number: 'XXX-XXX-XXXX', first_name: 'Antonio', last_name: 'Rivera',
                        car_model: '<Car Model>', check_in_time: '2022-09-18 22:26:00')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a phone number' do
    subject.phone_number = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a first name' do
    subject.first_name = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a last name' do
    subject.last_name = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a car model' do
    subject.car_model = nil
    expect(subject).not_to be_valid
  end
end
