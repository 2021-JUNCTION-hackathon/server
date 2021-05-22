class MobilitySerializer < ActiveModel::Serializer
  ATTRIBUTES = [:id, :ride_type, :uid, :impulse, :lat, :lng, :created_at, :updated_at]
  
  attributes ATTRIBUTES
  attribute (:impulse) do
    if object.impulse >= 1.0 && object.impulse <= 3.9
      Mobility::LEVEL[Mobility::LevelType::CAREFUL]
    elsif object.impulse >= 4.0 && object.impulse <= 7.9
      Mobility::LEVEL[Mobility::LevelType::DANGER]
    else
      Mobility::LEVEL[Mobility::LevelType::WARNING]
    end
  end
end
