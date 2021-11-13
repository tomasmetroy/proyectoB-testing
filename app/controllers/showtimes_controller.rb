# frozen_string_literal: true

class ShowtimesController < ApplicationController
  def index
    movie = Movie.all.first
    schedule = Schedule.all.first
    theater = Theater.all.first
    showtime = Showtime.new
    showtime.movie_id = movie.id
    showtime.schedule_id = schedule.id
    showtime.theater_id = theater.id
    showtime.save
    @showtimes = Showtime.all
  end
end
