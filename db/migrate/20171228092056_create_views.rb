class CreateViews < ActiveRecord::Migration[5.1]
  def change
    create_table :views do |t|
    	t.references :movies
      t.timestamps
    end
  end
end
