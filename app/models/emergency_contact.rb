# frozen_string_literal: true

class EmergencyContact < ApplicationRecord
  validates :phone_number, presence: true
  validates :full_name, presence: true
  validates :relation, presence: true
end
