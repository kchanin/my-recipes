class Chef < ActiveRecord::Base
  has_many :recipes
  has_many :likes
  before_save { self.email = email.downcase }
  validates :chefname, presence: true, length: 3..39
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/is
  validates :email, presence: true, length: { maximum: 105}, uniqueness: { case_sensitive: false}, format: {with: VALID_EMAIL_REGEX }
  has_secure_password
  
end