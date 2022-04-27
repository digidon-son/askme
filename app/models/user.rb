class User < ApplicationRecord
  has_secure_password

  before_save :downcase_nickname

  validates :email, presence: true, uniqueness: true
  validates_each :email do |record, attr, value|
    record.errors.add(attr, 'invalid') unless value =~ /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  end
  validates :nickname, uniqueness: true, length: { maximum: 40 }
  validates_each :nickname do |record, attr, value|
    unless value =~ /^[A-Za-z0-9_]*$/
      record.errors.add(attr,
                        'can only contain Latin letters, numbers, and the _ sign')
    end
  end

  def downcase_nickname
    nickname.downcase!
  end
end
