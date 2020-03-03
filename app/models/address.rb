class Address < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :users

  # Validations
  validates :line_1, :city, :state, :zip, :user_id, presence: true
  validates :line_1, :city, length: {minimum: 3}
  validates :line_2, length: {minimum: 3}, allow_blank: true
  validates :state, length: {minimum: 2}
  validates :zip, length: {is: 5}

end

