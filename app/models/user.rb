class User < ApplicationRecord
  has_secure_password
  has_many :reviews, as: :reviewable
  has_many :books, dependent: :destroy
  has_many :messages
  has_one  :survey
  has_many :conversations, through: :participations
  validates :name, presence: true
  validates :email,presence: true
  validates_numericality_of :phone_number, :on => :create


  has_many :test,class_name: 'Message', foreign_key: :recipient_id

  def received_messages(page)
    Message.where(recipient: self).page(page)
  end

  def sent_messages(page)
    Message.where(sender: self).page(page)
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
