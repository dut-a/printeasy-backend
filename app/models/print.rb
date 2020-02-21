class Print < ApplicationRecord
  # Associations
  belongs_to :service
  belongs_to :user
end
