class RemoveColumnFromMovies < ActiveRecord::Migration[5.1]
  def change
    remove_column :movies, :review, :string
  end
end
