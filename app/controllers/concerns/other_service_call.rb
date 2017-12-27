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
        description = b["description"]
         plot = b["Plot"]
         if b["imdbRating"].split('/').second == nil
            rating = b["imdbRating"]
          else
            rating = b["imdbRating"]
          end
         
          
          
          return movie_create(title,year,image,plot,rating,description)
          return false
      end
  end
  private
      def movie_create(title,year,image,plot,rating,description)
        @m = Movie.new
        
        @m.title = title
        @m.year = year
        @m.photo = image
        @m.plot =plot
        @m.rating = rating
        @m.description = description
    
        if @m.save
            
          return true
        else
            
          return false
        end
    end
end
 