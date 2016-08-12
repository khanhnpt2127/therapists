class User < ApplicationRecord
  has_secure_password
  has_many :reviews, as: :reviewable
  has_many :books, dependent: :destroy
end
