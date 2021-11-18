class MoviesController < ApplicationController
  before_action :set_theaters, only: :new

  SCHEDULES = %w[Tanda Matinee Night].freeze

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    respond_to do |format|
      if @movie.save
        matinee_theaters = movie_params[:matinee]
        tanda_theaters = movie_params[:tanda]
        night_theaters = movie_params[:night]
        matinee_theaters.each do |theater|
          matinee_showtime = Showtime.new(movie_id: @movie.id, theater: theater, schedule: 'Matinee')
          matinee_showtime.save
        end
        tanda_theaters.each do |theater|
          tanda_showtime = Showtime.new(movie_id: @movie.id, theater: theater, schedule: 'Tanda')
          tanda_showtime.save
        end
        night_theaters.each do |theater|
          night_showtime = Showtime.new(movie_id: @movie.id, theater: theater, schedule: 'Night')
          night_showtime.save
        end
        format.html { redirect_to @movie, notice: 'Movie correctly saved.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  private
  def movie_params
    set_movie_theathers
    params.require(:movie).permit(:name, :image, matinee: [], tanda: [], night: [])
  end

  def set_theaters
    @schedules = {}
    SCHEDULES.each do |schedule|
      schedule_showtimes = Showtime.where(schedule: schedule).pluck(:theater)
      @schedules[schedule] = set_rooms - schedule_showtimes
    end
  end

  def set_rooms
    theaters = []
    (1..8).each do |n|
      theaters.push("Sala#{n}")
    end
    theaters
  end

  def set_movie_theathers
    SCHEDULES.each do |schedule|
      selected = params.require(:movie).select { |key, value| key.to_s.match(schedule) }
      selected = selected.to_unsafe_h.map { |key, value| key.split('-')[1] }
      params.require(:movie)[schedule.downcase.to_sym] = selected
    end
  end
end