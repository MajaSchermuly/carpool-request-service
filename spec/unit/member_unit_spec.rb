# frozen_string_literal: true

# location: spec/unit/member_unit_spec.rb
require 'rails_helper'

RSpec.describe Member, type: :model do
  subject do
    described_class.new(driver_id: 1, username: 'neone', password: 'neone', leaderboard_points: 99.5,
                        emergency_contact_id: 1)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a username' do
    subject.username = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a password' do
    subject.password = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a username' do
    subject.emergency_contact_id = nil
    expect(subject).not_to be_valid
  end
end
