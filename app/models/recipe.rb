class Recipe < ActiveRecord::Base
  belongs_to :chef
  validates :chef_id, presence: true
  validates :name, presence: true, length: {minimum: 5, maximum: 100}
  validates :summary, presence: true, length: 10..150
  validates :description, presence: true, length: 20..500
end
