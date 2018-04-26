class Category < ActiveRecord::Base
  has_many :books, through: :book_categories
end
