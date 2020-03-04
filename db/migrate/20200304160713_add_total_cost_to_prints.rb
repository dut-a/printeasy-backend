class AddTotalCostToPrints < ActiveRecord::Migration[5.1]
  def change
    add_column :prints, :total_cost, :decimal
  end
end
