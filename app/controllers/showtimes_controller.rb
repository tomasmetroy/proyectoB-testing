# frozen_string_literal: true

class ShowtimesController < ApplicationController
  def index
    movie = Movie.all.first
    schedule = Schedule.all.first
    theater = Theater.all.first
    showtime = Showtime.new(movie_id: movie.id, theater_id: theater.id, schedule_id: schedule.id)
    puts '--------------------------'
    puts '--------------------------'
    puts showtime.movie
    puts '--------------------------'
    puts '--------------------------'
    showtime.save
    @showtimes = Showtime.all
  end
end
