class RemoveColumnFromMovie < ActiveRecord::Migration[5.1]
  def change
    remove_column :movies, :text, :text
    remove_column :movies, :description, :text
  end
end
