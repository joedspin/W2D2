# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all
CatRentalRequest.destroy_all

cat1 = Cat.create(name: "Digby", color: "black", sex: "M", birth_date:"2014-05-04")
cat2 = Cat.create(name: "Opal", color: "snickers", sex: "F", birth_date:"2017-12-14")
cat3 = Cat.create(name: "Penny", color: "white", sex: "F", birth_date:"2005-05-01")

request1 = CatRentalRequest.create(cat_id: cat1.id, start_date: "2018-12-18", end_date: "2018-12-28", status: "APPROVED")
request2 = CatRentalRequest.create(cat_id: cat1.id, start_date: "2018-12-01", end_date: "2018-12-03", status: "APPROVED")
request3 = CatRentalRequest.create(cat_id: cat2.id, start_date: "2018-11-01", end_date: "2018-11-28", status: "APPROVED")
request4 = CatRentalRequest.create(cat_id: cat2.id, start_date: "2018-12-10", end_date: "2018-12-25", status: "PENDING")

