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
             :addresses,
             :prints,
             :services,
             :created_at,
             :updated_at

  # Associations
  has_many :prints
  has_many :addresses
  has_many :services

end

