class Print < ApplicationRecord
  # Associations
  belongs_to :service
  belongs_to :user

  # Validations
  validates :print_type,
            :number_of_copies,
            :ordered_by,
            :fulfilled_by,
            :payment_method,
            :payment_status,
            :pickup_location,
            :pickup_type,
            :delivery_address,
            :placed_on,
            :estimated_completion_time,
            :status,
            :user_id,
            :service_id, presence: true

  validates :pickup_location, :delivery_address, allow_blank: true

end
