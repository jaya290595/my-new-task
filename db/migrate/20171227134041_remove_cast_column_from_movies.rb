class RemoveCastColumnFromMovies < ActiveRecord::Migration[5.1]
  def change
   remove_column :movies, :cast, :string
  end
end
