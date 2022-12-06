# frozen_string_literal: true

# location: spec/unit/ndr_unit_spec.rb
require 'rails_helper'

RSpec.describe Ndr, type: :model do
  subject do
    described_class.create(is_active: false, member_id: 1, start_time: '2022-11-14 01:00', end_time: '2022-11-14 23:00', members_needed: true, num_members_desired: 5)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
end
