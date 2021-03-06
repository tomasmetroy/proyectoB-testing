# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Ticket.delete_all
Showtime.delete_all
Movie.delete_all

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

=begin 
Movie.create(
  [
    { name: 'Movie 1', matinee: ['Sala1','Sala4'], tanda: ['Sala1','Sala2'], night: ['Sala1','Sala3']},
  ]
) 

Showtime.create(
  [
    { movie_id: 1, theater: 'Sala1', schedule: 'Matinee' },
    { movie_id: 1, theater: 'Sala4', schedule: 'Matinee' },
    { movie_id: 1, theater: 'Sala1', schedule: 'Tanda' },
    { movie_id: 1, theater: 'Sala2', schedule: 'Tanda' },
    { movie_id: 1, theater: 'Sala1', schedule: 'Night' },
    { movie_id: 1, theater: 'Sala3', schedule: 'Night' },
  ]
)
=end


Ticket.create(
  [
    { user: "Nicolas", row: "A", seat: "1", showtime_id: "1"},
    { user: "Nicolas", row: "A", seat: "2", showtime_id: "1"},
    { user: "Nicolas", row: "A", seat: "1", showtime_id: "2"}
  ]
)