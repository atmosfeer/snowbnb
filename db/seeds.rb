# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do
  Chalet.create({
    title:            Faker::Lorem.sentence,
    description:      Faker::Lorem.sentence(4),
    city:             Faker::Address.city,
    daily_price:      [50,60,70,80].sample,
    max_nb_of_guests: [1,2,3,4,5].sample,
    availability:     false
    })
end