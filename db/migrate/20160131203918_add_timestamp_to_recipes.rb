class AddTimestampToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :created_at, :timestamp
    add_column :recipes, :updated_at, :timestamp
  end
end
