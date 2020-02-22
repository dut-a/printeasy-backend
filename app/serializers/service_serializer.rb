class ServiceSerializer < ActiveModel::Serializer
  attributes :id, :service_type, :cost, :time_to_complete, :user, :created_at, :updated_at

  # TODO: Extract this into a mixin
  def user
    return {
      id: self.object.user.id,
      username: self.object.user.username,
      user_type: self.object.user.user_type,
      bio: self.object.user.bio,
      picture: self.object.user.picture,
      phone_number: self.object.user.phone_number,
      email_address: self.object.user.email_address,
      physical_address: self.object.user.physical_address,
      name: self.object.user.name, # merchant
      first_name: self.object.user.first_name, # customer
      middle_name: self.object.user.middle_name, # customer
      last_name: self.object.user.last_name, # customer
      fax_number: self.object.user.fax_number, # merchant
      website: self.object.user.website, # merchant
      business_hours: self.object.user.business_hours
    }
  end

end

