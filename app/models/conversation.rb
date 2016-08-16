class Conversation < ApplicationRecord
  belongs_to :sender, polymorphic: true
  belongs_to :recipient, polymorphic: true
  has_many :messages, dependent: :destroy

  validates :sender, :recipient, presence: true

  scope :for, -> (user) do
  	where(sender: user).or(where(recipient: user))
  end
end
