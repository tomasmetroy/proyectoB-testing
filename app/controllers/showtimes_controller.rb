# frozen_string_literal: true

class ShowtimesController < ApplicationController
  def index
    movie = Movie.all.first
    schedule = Schedule.all.first
    theater = Theater.all.first
    showtime = Showtime.new
    showtime.movie = movie
    showtime.schedule = schedule
    showtime.theater = theater
    puts '--------------------------'
    puts '--------------------------'
    puts showtime.movie
    puts '--------------------------'
    puts '--------------------------'
    showtime.save
    @showtimes = Showtime.all
  end
end
