class User < ApplicationRecord
  include Gravtastic

  VALID_EMAIL_REGEXP = /\A\w+@\w+\.[a-z]+/
  VALID_NICKNAME_REGEXP = /\A\w*\Z/
  VALID_HEAD_COLOR_REGEXP = /\A#\h{3}{1,2}\z/

  has_many :questions, dependent: :destroy

  has_secure_password

  before_save :downcase_nickname

  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEXP }
  validates :nickname, presence: true, uniqueness: true, length: { maximum: 40 },
                       format: { with: VALID_NICKNAME_REGEXP }
  validates :header_color, length: { minimum: 4, maximum: 7 }, format: { with: VALID_HEAD_COLOR_REGEXP }

  gravtastic(secure: true, filetype: :png, size: 100, default: 'retro')

  def downcase_nickname
    nickname&.downcase!
  end

  def to_param
    nickname
  end
end
