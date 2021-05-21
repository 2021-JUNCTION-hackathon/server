# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do
  uid = %w[0d8c266397 93fa8182ee 082e6d419e 8af12b3ed0 ee6aae5ebc].sample
  Mobility.create!(ride_type: 'bicycle', uid: uid, impulse: rand(1.3..2.5).round(3), lat: rand(37.48158..37.48219), lng: rand(127.1240..127.1253))
end
