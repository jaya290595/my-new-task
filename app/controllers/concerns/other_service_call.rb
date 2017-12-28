class OtherServiceCall
 def api_call(title)
     
     @title= title.split(' ').join('_')
     uri = URI("http://www.omdbapi.com/?t=#{@title}&apikey=72171e56")
     a= Net::HTTP.get(uri)
     b= JSON.parse(a)
     if b["Response"]== "True"
         title= b["Title"]
         year = b["Year"]
        image = b["Poster"]
         plot = b["Plot"]
         cast = b["Actors"]
         genre = b["Genre"]
         if b["imdbRating"].split('/').second == nil
            rating = b["imdbRating"]
          else
            rating = b["imdbRating"]
          end
          
          
          
          return movie_create(title,year,image,plot,rating,cast,genre)
      
       else
        return false
 
      end
  end
 


  private
      def movie_create(title,year,image,plot,rating,cast,genre)
       
        @m = Movie.new
      
        @m.title = title
        @m.year = year
        @m.remote_photo_url = image
        @m.plot =plot
        @m.rating = rating
        @m.cast = cast
        @m.genre = genre
         
        if @m.save
            
          return true
        else
            
          return false
        end
    end
end
 