class UserSerializer < ActiveModel::Serializer
  attributes :id,
             :username,
             :user_type,
             :bio,
             :picture,
             :alt_picture,
             :phone_number,
             :email_address,
             :physical_address,
             :name,
             :first_name,
             :middle_name,
             :last_name,
             :fax_number,
             :website,
             :business_hours,
             :created_at,
             :updated_at
end
