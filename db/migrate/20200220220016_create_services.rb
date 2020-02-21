class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.string :type
      t.string :cost
      t.string :time_to_complete
      t.integer :user_id

      t.timestamps
    end
  end
end
