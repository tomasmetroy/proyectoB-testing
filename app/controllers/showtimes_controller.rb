# frozen_string_literal: true

class ShowtimesController < ApplicationController
  def index
    @showtimes = Showtime.all
  end
end
