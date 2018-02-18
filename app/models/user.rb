class User < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :username, presence: true, length: { in: 2..20 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }  
  validates :password, presence: true, on:create
  has_many :recipes
  has_many :comments, dependent: :delete_all
  has_many :upvotes, dependent: :delete_all
  has_many :downvotes, dependent: :delete_all
  has_many :commented_recipes, through: :comments, source: :recipe
  has_many :upvoted_recipes, through: :upvotes, source: :recipe
  has_many :downvoted_recipes, through: :downvotes, source: :recipe
  has_secure_password
end
