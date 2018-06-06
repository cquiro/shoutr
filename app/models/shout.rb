class Shout < ApplicationRecord
  belongs_to :user
  belongs_to :content, polymorphic: true

  validates :user, presence: true
  validates_presence_of :content

  delegate :username, to: :user
end
