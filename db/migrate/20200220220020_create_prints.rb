class CreatePrints < ActiveRecord::Migration[5.1]
  def change
    create_table :prints do |t|
      t.string :type
      t.integer :number_of_copies
      t.integer :ordered_by
      t.integer :fulfilled_by
      t.string :payment_method
      t.string :payment_status
      t.string :pickup_location
      t.string :pickup_type
      t.string :delivery_address
      t.string :placed_on
      t.string :estimated_completion_time
      t.string :status
      t.integer :user_id
      t.integer :service_id

      t.timestamps
    end
  end
end
