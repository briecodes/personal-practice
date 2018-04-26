class Author < ActiveRecord::Base
  has_many :books, through: :book_authors
  has_many :categories, through: :books
  has_many :publishers, through: :books
end
