ActiveAdmin.register Movie do
  permit_params :title,:image,:description,:rating,:reviews


  index do
    selectable_column
    id_column
    column :title
    column :image
    column :reviews
    column :description
    column :rating
    actions
  end

  filter :title

  action_item :new_movie,only: :index do
    link_to "Automatically Movie Upload", "#{ Rails.application.secrets.url}/admin/movies/new?view=automatic"
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs do
      render "movies/form",{movies: movie,view: params[:view]}
    end
  end



end
