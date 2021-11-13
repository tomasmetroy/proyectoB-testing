# frozen_string_literal: true

class ShowtimesController < ApplicationController
  def index
    movie = Movie.create(name: 'Movie 1', image: 'url-example1')
    movie.save
    schedule = Schedule.create(name: 'NOCHE', range: '21:00 - 23:00')
    schedule.save
    theater = Theater.create( name: 'Sala 1' )
    theater.save
    showtime = Showtime.new(movie: movie, schedule:schedule, theater: theater)
    showtime.movie_id = movie.id
    showtime.schedule_id = schedule.id
    showtime.theater_id = theater.id
    showtime.save
    @showtimes = Showtime.all
  end
end
