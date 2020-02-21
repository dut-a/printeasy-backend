class MakeSomeUserFieldsNullByDefault < ActiveRecord::Migration[5.1]
  def change
    fields = [
      "name",
      "first_name",
      "middle_name",
      "last_name",
      "fax_number",
      "website",
      "business_hours"
    ]

    fields.each do |f|
      change_column_null(:users, f.to_sym, true, nil)
    end

  end
end
