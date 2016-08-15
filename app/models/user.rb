class User < ApplicationRecord
  has_secure_password
  has_many :reviews, as: :reviewable
  has_many :books, dependent: :destroy
  has_many :messages, foreign_key: 'sender_id'
  has_many :received_messages,class_name: 'Message', foreign_key: :recipient_id

  def self.sent_messages
    where(sender: self)
  end

  def latest_received_messages(n)
    received_messages.order(created_at: :desc).limit(n)
  end

  def load_received_messages
    received_messages
  end

  def unread_messages
    received_messages.unread
  end
end
