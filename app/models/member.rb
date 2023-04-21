# frozen_string_literal: true

class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  # validates :username, presence: true
  # validates :password, presence: true
  # validates_confirmation_of :password
  # validates :address, presence: true
  # validates :phone, presence: true
  # validates :is_male, presence: true
  # validates :first_name, presence: true
  # validates :last_name, :first_name, :is_male, :phone, :address, :emergency_full_name, :emergency_phone_number, presence: true, on: [:update]
  validates :last_name, :first_name, :address, presence: true, if: :valid_non_provider?
  validate :validate_email_on_whitelist, if: :valid_non_provider?

  def validate_email_on_whitelist
    email = self.email
    errors.add(:member, 'email is not approved by admins, Please contact CARPOOL executives to create account.') unless Whitelist.exists?(email: email)
  end

  # phone number validations
  validates :phone, format: { with: /\A\d{3}-\d{3}-\d{4}\z/i, message: "must be in the format ###-###-####" }, if: :valid_non_provider?
  validates :emergency_1_phone_number, format: { with: /\A\d{3}-\d{3}-\d{4}\z/i, message: "must be in the format ###-###-####" }, if: :valid_non_provider?
  # validates :parent_number, phone_number: { format: /^(?:(?:[2-9]11)|(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:\x20+|#|x\.?|ext\.?|extension)\s*(\d+))?)$/i }, if: :valid_non_provider?
  # validates :emergency_2_phone_number, phone_number: { format: /^(?:(?:[2-9]11)|(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:\x20+|#|x\.?|ext\.?|extension)\s*(\d+))?)$/i }, if: :valid_non_provider?

  def valid_non_provider?
    provider.nil?
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |member|
      member.email = auth.info.email
      member.password = Devise.friendly_token[0, 20]
      member.full_name = auth.info.name
      member.avatar_url = auth.info.image
      member.created_password = false
    end
  end
end
