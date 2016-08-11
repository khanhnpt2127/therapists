class Host < ApplicationRecord
  has_secure_password
  has_many :users
end
