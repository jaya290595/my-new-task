class AddColumnToMovie < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :cast, :text
    add_column :movies, :genre, :text
  end
end
