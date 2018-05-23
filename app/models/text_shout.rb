class TextShout < ApplicationRecord
  has_one :shout, as: :content

  validates :body, presence: true, length: { in: 1..144 }
end
