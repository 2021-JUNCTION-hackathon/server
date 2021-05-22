# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do
  uid = %w[0d8c266397 93fa8182ee 082e6d419e 8af12b3ed0 ee6aae5ebc].sample
  ride_type = %i[bicycle kick_board].sample
  Mobility.create!(ride_type: ride_type, uid: uid, impulse: rand(1.3..10).round(3), lat: rand(37.478303..37.532917), lng: rand(127.120959..127.141503))
end

t = Mobility.create!(ride_type: 'kick_board', uid: '93fa8182ee', impulse: rand(1.3..10).round(3), lat: 37.47822262735822, lng: 127.1274432454535)
 