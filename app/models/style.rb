class Style < ActiveRecord::Base
  validates :name, presence: true, length: 2..25
  has_many :recipe_styles
  has_many :recipes, through: :recipe_styles
end
