# frozen_string_literal: true

class Whitelist < ApplicationRecord
  validates :email, presence: true, uniqueness: true
end
