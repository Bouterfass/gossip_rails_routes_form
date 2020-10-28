# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

array_user = []
array_city = []
array_gossip = []
array_tag = []

10.times do
  array_city << City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
end

20.times do
  array_user << User.create(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name, description: Faker::Movies::Hobbit.quote, email: Faker::Internet.email, age: Faker::Number.within(range: 18..100), city: array_city.sample)
end

20.times do
  array_tag << Tag.create(title: "##{Faker::Movies::StarWars.droid}")
end

40.times do
  array_gossip << Gossip.create(title: Faker::Movies::StarWars.planet, content: Faker::Quote::yoda, user: array_user.sample)
end

60.times do
  Linktag.create(gossip: array_gossip.sample, tag: array_tag.sample)
end

10.times do
  PrivateMessage.create(content: Faker::TvShows::HowIMetYourMother.quote, sender: array_user.sample, recipient: array_user.sample)
end
