# frozen_string_literal: true

class Ndr < ApplicationRecord
  has_many :drivers

  validates_numericality_of :num_members_desired, allow_nil: true, greater_than_or_equal_to: 0
  validates_numericality_of :num_members_signed_up, allow_nil: true, greater_than_or_equal_to: 0
  validate :ndr_times_correct
  validates :start_time, presence: true
  validates :end_time, presence: true

  # validates if ndr times make sense and are correct.
  def ndr_times_correct
    errors.add(:member, 'NDR start time must be before or at the end time.') if start_time > end_time
  end
end
