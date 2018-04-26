require './config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/books" do
    # binding.pry
    @books = Book.all
    erb :"books/books"
  end

  post "/books" do
    # binding.pry
    @new_book = Book.create("title" => params[:title], "written_date" => params[:written_date])

    # CATEGORY LOGIC
    if params[:new_category].empty? == false
      new_cat = Category.create("category" => params[:new_category])
      BookCategory.create("category_id" => new_cat.id, "book_id" => @new_book.id)
    end
    if params.key?("book")
      params[:book][:category_ids].each do |c_id|
        BookCategory.create("category_id" => c_id, "book_id" => @new_book.id)
      end
    end

    # AUTHOR LOGIC
    if params[:author][:first_name].empty? == false
      # new_a = Author.create("fist_name" => params[:author][:first_name], "last_name" => params[:author][:last_name])
      # BookAuthor.create("author_id" => new_a.id, "book_id" => @new_book.id)
    end
    binding.pry
    if params[:author_id].empty? == false
      BookAuthor.create("author_id" => params[:author_id], "book_id" => @new_book.id)
    end

    redirect to "/books/#{@new_book.id}"
  end

  get "/books/new" do
    @authors = Author.all
    @categories = Category.all
    erb :"books/new"
  end

  get "/books/:id" do
    @book = Book.find(params[:id])
    erb :"books/show"
  end

  post "/books/:id" do
    @book = Book.find(params[:id])
    @book.update(params)
    erb :"books/show"
  end

  get "/books/:id/edit" do
    @book = Book.find(params[:id])
    erb :"books/edit"
  end

end
