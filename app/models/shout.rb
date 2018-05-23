class Shout < ApplicationRecord
  belongs_to :user
  belongs_to :content, polymorphic: true

  validates :user, presence: true
  validates_presence_of :content

  # using default_scope is frowned upon. Check google before using it.
  default_scope { order(created_at: :desc) }

  delegate :username, to: :user
end
