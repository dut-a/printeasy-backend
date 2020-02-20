class Service < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :prints
end
