class User < ApplicationRecord
  # Associations
  has_many :prints
  has_many :addresses
  has_many :services

  # other attrs
  has_secure_password
end
