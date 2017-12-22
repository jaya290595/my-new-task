class CommentsController < ApplicationController

	def create
		
	    @movie = Movie.find(params[:movie_id])
	    	
	    
	    @comment = @movie.comments.new(comment_params)
	    @comment.user_id= current_user.id
	   
	    @comment.save
	    redirect_to movie_path(@movie)
	  end

	  private
	      def comment_params
	        params.require(:comment).permit(:reviews)
	      end
	  end
