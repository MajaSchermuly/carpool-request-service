# frozen_string_literal: true

class Car < ApplicationRecord
  has_many :assignment

  validates :make, presence: true
  validates :model, presence: true
  validates :color, presence: true
  validates :plate_number, presence: true
  validates :registration_expiry, presence: true
  validates :display_id, presence: true
  validates :ndr_id, presence: false

  # make sure the plate number is created as uppercase
  def plate_number=(value)
    write_attribute :plate_number, value.upcase
  end
end
