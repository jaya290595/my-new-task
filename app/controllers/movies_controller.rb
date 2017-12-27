class MoviesController < ApplicationController
  before_action :find_movie, only: [:show,:edit,:update,:destroy]
  

  def index
  @movies = Movie.all
  end


  def create
            
           if params[:view]='automatic'
               
                @mv = OtherServiceCall.new.api_call(params[:movie][:title])
                if @mv == true
                  redirect_to "192.168.3.3/admin/movies",notice: "movie Successfully Saved"
                else
                      redirect_to new_admin_movie_path(view: params[:view]),alert: "Movie Not Found Please verify it."
                end
          else
              @movie = Movie.new(movie_params)
              if @movie.save
                   redirect_to "192.168.3.3/admin/movies",notice: "movie Successfully Saved"
         else
          redirect_to new_admin_movie_path
              
              end
          end
      end
   def new
  	@movie= Movie.new

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
      else
      end

    end

 private

def movie_params
	params.require(:movie).permit(:title,:text,:photo,:description,:rating,:plot,:year)
end

def find_movie
  @movie=Movie.find(params[:id])

end
end

