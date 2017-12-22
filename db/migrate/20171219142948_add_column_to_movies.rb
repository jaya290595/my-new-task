class AddColumnToMovies < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :review, :text
    add_column :movies, :rating, :string
    add_column :movies, :description, :text
  end
end
