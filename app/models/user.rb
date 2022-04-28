class User < ApplicationRecord
  VALID_EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  VALID_NICKNAME_REGEXP = /\A[\w_]*\Z/
  has_secure_password

  before_save :downcase_nickname

  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEXP }

  validates :nickname, uniqueness: true, length: { maximum: 40 }, format: { with: VALID_NICKNAME_REGEXP }

  def downcase_nickname
    nickname.downcase!
  end
end
