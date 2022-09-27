# frozen_string_literal: true

# location: spec/unit/rider_unit_spec.rb
require 'rails_helper'

RSpec.describe Rider, type: :model do
  subject do
    described_class.new(phone_number: 'XXX-XXX-XXXX', first_name: 'Taylor', last_name: 'Montana',
                        local_address: '<Home Address>', emergency_contact_id: 'XXX-XXX-XXXX')
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

  it 'is not valid without a local address' do
    subject.local_address = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without an emergency contact' do
    subject.emergency_contact_id = nil
    expect(subject).not_to be_valid
  end
end
