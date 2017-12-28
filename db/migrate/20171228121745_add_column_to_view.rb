class AddColumnToView < ActiveRecord::Migration[5.1]
  def change
    add_column :views, :count, :integer
  end
end
