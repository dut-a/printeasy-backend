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
             :created_at,
             :updated_at

end
