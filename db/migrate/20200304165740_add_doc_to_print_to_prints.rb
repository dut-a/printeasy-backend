class AddDocToPrintToPrints < ActiveRecord::Migration[5.1]
  def change
    add_column :prints, :doc_to_print, :string
  end
end
