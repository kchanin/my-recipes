class Ingredient < ActiveRecord::Base
    validates :name, presence: true, length: 2..25
    has_many :recipe_ingredients
    has_many :recipes, through: :recipe_ingredients

end
