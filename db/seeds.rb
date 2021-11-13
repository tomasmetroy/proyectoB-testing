# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Schedule.delete_all
Movie.delete_all
Theater.delete_all

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

Schedule.create(
  [
    { name: 'MATINÉ', range: '17:00 - 19:00' },
    { name: 'TANDA', range: '19:00 - 21:00' },
    { name: 'NOCHE', range: '21:00 - 23:00' }
  ]
)
Movie.create(
  [
    { name: 'Movie 1', image: 'url-example1' },
    { name: 'Movie 2', image: 'url-example2' },
    { name: 'Movie 3', image: 'url-example3' }
  ]
)
Theater.create(
  [
    { name: 'Sala 1' },
    { name: 'Sala 2' },
    { name: 'Sala 3' },
    { name: 'Sala 4' },
    { name: 'Sala 5' },
    { name: 'Sala 6' },
    { name: 'Sala 7' },
    { name: 'Sala 8' }
  ]
)
