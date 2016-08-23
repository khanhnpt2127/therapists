class Host < ApplicationRecord
  has_secure_password
  has_many :reviews , as: :reviewable
  has_many :books, dependent: :destroy
  has_many :conversations, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true
  validates_numericality_of :phone_number, :on => :create
  
  def received_messages(page)
    Message.where(recipient: self).page(page)
  end
end
