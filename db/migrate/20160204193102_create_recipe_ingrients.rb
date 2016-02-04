class CreateRecipeIngrients < ActiveRecord::Migration
  def change
    create_table :recipe_ingrients do |t|
      t.integer :ingredient_id
    end
  end
end
