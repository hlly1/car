# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create([
  {name: 'admin', email:'admin@example.com', password:'password', isadmin:1}
])

Vehicle.create(
  [ 
  {name: 'Car1', detail: 'This is car1.', price:'10.12', location:'652/656 North Rd, Ormond VIC 3204' },
  {name: 'Car2', detail: 'This is car2.', price:'20.30', location: 'Ormond VIC 3204' },
  {name: 'Car3', detail: 'This is car3.', price:'19.11', location: '358 Koornang Rd, Carnegie VIC 3163' },
  {name: 'Car4', detail: 'This is car4.', price:'13.22', location: '328 Swanston St, Melbourne VIC 3000' },
  {name: 'Car5', detail: 'This is car5.', price:'30.21', location: '239 Elizabeth St, Melbourne VIC 3000' },
  {name: 'Car6', detail: 'This is car6.', price:'9.8', location: 'Flinders St, Melbourne VIC 3000' }
])

Vehicle.create([  {name: 'Nissan', detail: 'This is Nissan.', price:'11.2', location: '20 Wattle Tree Dr, Point Cook VIC 3030' },
  {name: 'Toyota', detail: 'This is Toyota.', price:'13.2', location: '64 Old Geelong Rd, Hoppers Crossing VIC 3029' }
])

Location.create(
  [
    {address:'900 Dandenong Rd, Caulfield East VIC 3145' },
    {address: '200 Leicester St, Carlton VIC 3053' },
    {address: '28 Parker St, Ormond VIC 3204' },
    {address: '304-306 Jasper Rd, Ormond VIC 3204' }
  ]
  )