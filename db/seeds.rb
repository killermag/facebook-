# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.new(email: 'fifa@gmail.com', username: 'bestphi', password: 'fifafor', first: 'foo', last: 'bar').save(validate: false)
User.new(email: 'fif@gmail.com', username: 'bestph', password: 'fifafor', first: 'foo', last: 'bar').save(validate: false)
User.new(email: 'fi@gmail.com', username: 'bestp', password: 'fifafor', first: 'foo', last: 'bar').save(validate: false)
User.new(email: 'f@gmail.com', username: 'best', password: 'fifafor', first: 'foo', last: 'bar').save(validate: false)
