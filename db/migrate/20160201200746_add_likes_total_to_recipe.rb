class AddLikesTotalToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :TotalLikes, :integer
  end
end
