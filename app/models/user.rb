class User < ApplicationRecord
  has_secure_password
  has_many :hosts
  has_many :books, dependent: :destroy
end
