class Publisher < ActiveRecord::Base
  has_many :books, through: :book_publisher
  has_many :authors, through: :books
  has_many :categories, through: :books
end
