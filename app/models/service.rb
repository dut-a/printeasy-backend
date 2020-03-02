class Service < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :prints
  accepts_nested_attributes_for :prints, :user

  # Validations
  validates :service_type,
            :cost,
            :time_to_complete,
            :user_id, presence: true

end
