class User < ApplicationRecord
  VALID_EMAIL_REGEXP =  /\A\w+@\w+\.[a-z]+/
  VALID_NICKNAME_REGEXP = /\A\w*\Z/
  VALID_HEAD_COLOR_REGEXP = /\A\#+[0-9a-zA-Z]*\Z/
  has_secure_password

  before_save :downcase_nickname

  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEXP }

  validates :nickname, uniqueness: true, length: { maximum: 40 }, format: { with: VALID_NICKNAME_REGEXP }

  validates :header_color, length: { maximum: 7 }, format: { with: VALID_HEAD_COLOR_REGEXP }

  def downcase_nickname
    nickname.downcase!
  end
end
