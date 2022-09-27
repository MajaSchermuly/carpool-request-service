# frozen_string_literal: true

# location: spec/unit/emergency_contact_unit_spec.rb
require 'rails_helper'

RSpec.describe EmergencyContact, type: :model do
  subject do
    described_class.new(phone_number: 'XXX-XXX-XXXX', full_name: 'Mary Poppins', relation: 'Mother')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a phone number' do
    subject.phone_number = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a name' do
    subject.full_name = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a relation to a rider/member' do
    subject.relation = nil
    expect(subject).not_to be_valid
  end
end
