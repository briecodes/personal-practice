require './config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/authors" do
    @authors = Author.all
    erb :"authors/authors"
  end

  post "/authors" do
    @new_author = Author.create(params)

    redirect to "/authors/#{@new_author.id}"
  end

  get "/authors/new" do
    @books = Book.all
    erb :"authors/new"
  end

  get "/authors/:id" do
    @author = Author.find(params[:id])
    erb :"authors/show"
  end

  post "/authors/:id" do
    @author = Author.find(params[:id])
    @author.update(params)
    erb :"authors/show"
  end

  get "/authors/:id/edit" do
    @author = Author.find(params[:id])
    erb :"authors/edit"
  end

  post "/authors/:id/delete" do
    @author = Author.find(params[:id])
    @author.destroy
    erb :"authors/delete"
  end

end
