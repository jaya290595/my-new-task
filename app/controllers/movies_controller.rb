class MoviesController < ApplicationController
  before_action :find_movie, only: [:show,:edit,:update,:destroy]

  def index
    @movies=Movie.all

  end

   def new
  	@movie= Movie.new

  end

  def create
    @movie = Movie.new(movie_params)
  
    @movie.save
    redirect_to @movie 
  end
  
  def show
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
      redirect_to root_path
    else
      render 'edit'
    end
end
    
    def destroy
      @movie.destroy
      redirect_to root_path
  end

 private

def movie_params
	params.require(:movie).permit(:title,:text,:photo,:description,:rating,:review)
end

def find_movie
  @movie=Movie.find(params[:id])

end
end

