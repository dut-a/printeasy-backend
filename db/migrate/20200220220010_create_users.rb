class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :type
      t.string :bio
      t.string :picture
      t.string :phone_number
      t.string :email_address
      t.string :physical_address
      t.string :name # merchant
      t.string :first_name # customer
      t.string :middle_name # customer
      t.string :last_name # customer
      t.string :fax_number # merchant
      t.string :website # merchant
      t.string :business_hours # merchant

      t.timestamps
    end
  end
end
