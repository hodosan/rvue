# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Admin.create!( email: 'admin@example.com',  password: 'pass123' )
User.create!( name: 'tuji', email: 'tuji@example.com',  password: 'pass123' )
User.create!( name: 'nobu', email: 'nobu@example.com',  password: 'pass123' )
User.create!( name: 'info', email: 'info@example.com',  password: 'pass123' )
Room.create!( name: 'Rails Room', profile: 'splendid Rails room' )
Room.create!( name: 'Vue Room', profile: 'wonderful Vue room' )
Regulation.create!( begin_time: '09:00', close_time: '17:00', interval_s: '12:00', interval_e: '13:00', unit_minute: '30', version: '1' )