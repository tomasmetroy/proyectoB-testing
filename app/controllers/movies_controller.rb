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
    params.require(:movie).permit(:name, :image)
  end
end
