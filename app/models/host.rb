class Host < ApplicationRecord
  has_secure_password
  has_many :users
  has_many :books, dependent: :destroy
end
