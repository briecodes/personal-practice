class Book < ActiveRecord::Base
  belongs_to :author
  has_many :categories, through: :book_categories
  belongs_to :publisher
end
