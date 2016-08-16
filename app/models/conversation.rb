class Conversation < ApplicationRecord
  belongs_to :sender, polymorphic: true
  belongs_to :recipient, polymorphic: true
  has_many :messages, dependent: :destroy

  validates :sender, :recipient, presence: true

  scope :for, -> (user) do
    where(sender: user).or(where(recipient: user))
  end

  def self.between(sender, recipient_attrs)
    conditions1 = recipient_attrs.dup.merge(sender: sender)

    conditions2 = {
      sender_id: recipient_attrs[:recipient_id],
      sender_type: recipient_attrs[:recipient_type],
      recipient: sender
    }

    Conversation.where(conditions1).or(where(conditions2)).take
  end
end
