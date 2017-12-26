class MoviesController < ApplicationController
  before_action :find_movie, only: [:show,:edit,:update,:destroy]
  before_action :get_rating,only:[:index,:detail]
  before_action :get_view,only:[:index,:detail]

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


  def search_logic
      @view = params[:view]
       search = params[:search]
       if search
         capital_search = search.capitalize
         downcase_search = search.downcase
         upcase_search = search.upcase
         title_search = search.titleize
        @movies_rating = Movie.where("title like? OR title like? OR title like? OR title like?","#{capital_search}%","#{downcase_search}%","#{upcase_search}%","#{title_search}%").order('rating ASC')
        @movies_view = Movie.select("movies.*, COUNT(*) AS group_count").joins(:views).joins("JOIN views rg on rg.movie_id = views.movie_id").group('movies.id').where(id: @movies_rating.ids).order('group_count DESC')
      else
      end

    end

 private

def movie_params
	params.require(:movie).permit(:title,:text,:photo,:description,:rating,:review)
end

def find_movie
  @movie=Movie.find(params[:id])

end
end

