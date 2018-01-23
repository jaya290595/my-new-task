class MoviesController < ApplicationController
  before_action :find_movie, only: [:show,:edit,:update,:destroy]
  before_action :set_id, except: [:index,:detail,:create,:new]
  before_action :get_rating,only:[:index,:detail]
  before_action :get_view,only:[:index,:detail]
  

  def index
     if params[:search]
     @movies= Movie.search(params[:search])
     @movies_rating = Movie.search(params[:search])
     else
      @movies = Movie.all.order('created_at desc').limit(3) 
      @movies_view = @movies_view.limit(4)
      @movies_rating = @movies_rating.limit(4)
    end
  end

  def more
  @movies_rating = Movies.all 
  @movies_views = Movies.all
  end



  def create
    if params[:view]='automatic'
    @mv = OtherServiceCall.new.api_call(params[:movie][:title])

      if @mv == true
        redirect_to "https://jayamovie.herokuapp.com/admin/movies",notice: "movie Successfully Saved"
      else
        redirect_to new_admin_movie_path(view: params[:view]),alert: "Movie Not Found Please verify it."
      end

      else
          @movie = Movie.new(movie_params)
          if @movie.save
          redirect_to "https://jayamovie.herokuapp.com/admin/movies",notice: "movie Successfully Saved"
          else
          redirect_to new_admin_movie_path
      end
    end
  end
     

  def new
    #	@movie= Movie.new
  end


  def set_id
      @movies = Movie.find(params[:id])
  end
  
  def show
    View.create(movie_id: @movies.id)
    @genre_same= Movie.where(:genre=> @movie.genre)
    @movies_list = Movie.where(genre: @movies.genre).order('rating Desc')
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
        @movies_view =  Movie.where("title like? OR title like? OR title like? OR title like?","#{capital_search}%","#{downcase_search}%","#{upcase_search}%","#{title_search}%").order('view_count DESC')
      end
  end

  private

  def movie_params
	  params.require(:movie).permit(:title,:photo,:cast,:rating,:plot,:year,:genre)
  end

  def find_movie
    @movie=Movie.find(params[:id])
  end

  def get_view
    @movies_view = Movie.select("movies.*, COUNT(*) AS group_count").joins(:views).joins("JOIN views rg on rg.movie_id = views.movie_id").group('movies.id').order('group_count DESC')
  end

  def get_rating
    @movies_rating = Movie.all.order('rating desc')
  end
end

