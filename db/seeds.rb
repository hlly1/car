# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Location.create(
  [
    {name: 'State Library Parking', latitude: '-37.809800', longitude:'144.965200'},
    {name: 'Flinder Station Parking', latitude: '-37.818300', longitude:'144.967100'},
    {name: 'Mel Central Parking', latitude: '-37.810200', longitude:'144.962800'}
])