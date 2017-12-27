class AddColumnsToMovies < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :year, :int
    add_column :movies, :plot, :string
    add_column :movies, :cast, :string
  end
end
