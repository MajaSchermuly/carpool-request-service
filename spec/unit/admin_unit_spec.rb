# frozen_string_literal: true

# location: spec/unit/admin_unit_spec.rb
require 'rails_helper'

RSpec.describe Admin, type: :model do
  subject do
    described_class.new(username: 'neone', password: 'neone')
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
end
