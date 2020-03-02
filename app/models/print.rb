class Print < ApplicationRecord
  # Associations
  belongs_to :service
  belongs_to :user
  accepts_nested_attributes_for :service, :user

  # Validations
  validates :print_type,
            :number_of_copies,
            :ordered_by,
            :fulfilled_by,
            :payment_method,
            :payment_status,
            :pickup_type,
            :placed_on,
            :estimated_completion_time,
            :status,
            :user_id,
            :service_id, presence: true

  validates :pickup_location,
            :delivery_address, presence: true, allow_blank: true

end

