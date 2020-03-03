class AddressSerializer < ActiveModel::Serializer
  attributes :id, :line_1, :line_2, :city, :state, :zip, :user, :created_at, :updated_at

  # Associations
  belongs_to :user
  has_many :users

end

