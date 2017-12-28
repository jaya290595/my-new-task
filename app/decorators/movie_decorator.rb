class MovieDecorator < Draper::Decorator
  delegate_all
  


    def photo
    	

      if model.photo_url.present?
        h.image_tag(model.photo_url, width: "50px",height: "50px")
      else
      end
    end
 

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
