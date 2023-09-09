# frozen_string_literal: true

class Request < ApplicationRecord
  has_one :assignment

  validates :name, :phone_number, :pick_up_loc, :drop_off_loc, :num_passengers, presence: true

  # phone numbers organized by NPA-NXX-XXXX (assumed NA only)
  # NPA is area code (201-999)
  # NXX goes from 200-999
  # XXXX goes from 0000-9999
  # regex pulled from https://rubygems.org/gems/phone_number_validator documentation
  validates :phone_number, format: { with: /\A\d{3}-\d{3}-\d{4}\z/i, message: 'must be in the format ###-###-####' }

  def self.waiting
    Request.where(request_status: 'Unassigned').count
  end

  def self.riding
    Request.where(request_status: 'Assigned Driver').count
  end

  def self.done
    @ndr = Ndr.find_by(is_active: true)
    if @ndr
      Request.where('created_at > ? and created_at < ?', @ndr.start_time, @ndr.end_time).where(request_status: 'Done').count
    else
      '0'
    end
  end

  def self.missed
    @ndr = Ndr.find_by(is_active: true)
    if @ndr
      Request.where('created_at > ? and created_at < ?', @ndr.start_time, @ndr.end_time).where(request_status: 'Missed').count
    else
      '0'
    end
  end

  def self.cancelled
    @ndr = Ndr.find_by(is_active: true)
    if @ndr
      Request.where('created_at > ? and created_at < ?', @ndr.start_time, @ndr.end_time).where(request_status: 'Cancelled').count
    else
      '0'
    end
  end

  def self.search(search_name, search_phone_number)
    Request.where(name: search_name, phone_number: search_phone_number)
  end

  def self.match_lower(search_name)
    where('name ILIKE ?', search_name.to_s)
  end
end
