class Recipe < ActiveRecord::Base
  belongs_to :chef
  validates :chef_id, presence: true
  validates :name, presence: true, length: {minimum: 5, maximum: 100}
  validates :summary, presence: true, length: 10..150
  validates :description, presence: true, length: 20..500
  mount_uploader :picture, PictureUploader
  validate :picture_size
  
  private
    def picture_size
      if picture.size > 5.megabytes
        error.add(:picure, "should be less than 5MB")
      end
    end

end
