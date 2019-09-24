# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Vehicle.create(
#  [ 
#   {name: 'Car1', detail: 'This is car1.', price:'89.99', location:'652/656 North Rd, Ormond VIC 3204' },
#   {name: 'Car2', detail: 'This is car2.', price:'69.99', location: 'Ormond VIC 3204' },
#   {name: 'Car3', detail: 'This is car3.', price:'59.99', location: '358 Koornang Rd, Carnegie VIC 3163' },
#   {name: 'Car4', detail: 'This is car4.', price:'39.99', location: '328 Swanston St, Melbourne VIC 3000' },
#   {name: 'Car5', detail: 'This is car5.', price:'99.99', location: '239 Elizabeth St, Melbourne VIC 3000' },
#   {name: 'Car6', detail: 'This is car6.', price:'199.99', location: 'Flinders St, Melbourne VIC 3000' }
# ])

Location.create(
 [
   {address:'900 Dandenong Rd, Caulfield East VIC 3145' },
   {address: '200 Leicester St, Carlton VIC 3053' },
   {address: '28 Parker St, Ormond VIC 3204' },
   {address: '304-306 Jasper Rd, Ormond VIC 3204' }
  ]
 )