class User < ApplicationRecord
  # Associations
  has_many :prints
  has_many :addresses
  has_many :services
end
