class PrintSerializer < ActiveModel::Serializer
  attributes :id,
             :print_type,
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
             :user,
             :service,
             :total_cost,
             :doc_to_print,
             :print,
             :created_at,
             :updated_at

  # Associations
  belongs_to :service
  belongs_to :user

end
