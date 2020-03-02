class ServiceSerializer < ActiveModel::Serializer
  attributes :id, :service_type, :cost, :time_to_complete, :user, :prints, :created_at, :updated_at
end

