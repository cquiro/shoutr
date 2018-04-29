class Shout < ApplicationRecord
  belongs_to :user

  validates :body, presence: true, length: { in: 1..144 }
  validates :user, presence: true

  # using default_scope is frowned upon. Check google before using it.
  default_scope { order(created_at: :desc) }

  delegate :username, to: :user
end
