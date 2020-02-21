class Address < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :users
end
