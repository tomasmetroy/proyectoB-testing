class MoviesController < ApplicationController

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
        matinee_theaters = movie_params[:matinee].split(';')
        tanda_theaters = movie_params[:tanda].split(';')
        night_theaters = movie_params[:night].split(';')
        puts night_theaters
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
    params.require(:movie).permit(:name, :image, :matinee, :tanda, :night)
  end
end
