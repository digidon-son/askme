class Question < ApplicationRecord
  belongs_to :user
  validates :body, presence: true, length: { maximum: 280 }
  validates :answer, presence: true, length: { maximum: 280 }
end
