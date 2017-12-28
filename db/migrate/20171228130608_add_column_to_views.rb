class AddColumnToViews < ActiveRecord::Migration[5.1]
  def change
    add_column :views, :movie_id, :integer
  end
end
