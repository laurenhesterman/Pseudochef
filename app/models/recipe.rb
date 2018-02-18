class Recipe < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true, length: { in: 2..40 }
  validates :description, presence: true, length: { in: 2..140 }
  validates :level, :time, presence: true
  validates :text, presence: true
  has_many :comments, dependent: :delete_all
  has_many :upvotes, dependent: :delete_all
  has_many :downvotes, dependent: :delete_all
  has_many :commenting_users, through: :comments, source: :user
  has_many :downvoting_users, through: :downvotes, source: :user
  has_many :upvoting_users, through: :upvotes, source: :user
  has_many :categorized
  has_many :categories, through: :categorized, source: :category
  belongs_to :user

  searchable do
    text :ingredients, :description
    string :category  
    integer :time
    integer :level
    end
end
