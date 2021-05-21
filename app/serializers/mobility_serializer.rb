class MobilitySerializer < ActiveModel::Serializer
  ATTRIBUTES = [:id, :ride_type, :uid, :impulse, :lat, :lng, :created_at, :updated_at]
  
  attributes ATTRIBUTES
end
