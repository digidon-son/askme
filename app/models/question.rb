class Question < ApplicationRecord
  has_rich_text :body

  validates :body, presence: true, length: { maximum: 280 }
end
