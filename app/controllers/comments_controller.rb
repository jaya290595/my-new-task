class CommentsController < ApplicationController

	def create
		
	    @movie = Movie.find(params[:movie_id])
	    	
	    
	    @comment =Comments.new(comment_params)
	    @comment.user_id= current_user.id
	    @comment.movie_id = params[:movie_id]
	   
	   if @comment.save
        Thread.new{
        	@email = ReviewMail.new
        	@m = Movie.find(params[:movie_id])
        	@emil.thankyou_mail(current_user,@m,@comment)
        }

      
       redirect_to movie_path(params[:movie_id]),notice: "review add successfully"
    
     else
	

    redirect_to movie_path(params[:movie_id]), alert: "Review cannot saved"
       
       end
	  end

	  private
	      def comment_params
	        params.require(:comment).permit(:reviews)
	      end
	  end
