class PagesController < ApplicationController

  def index
    @books = Work.books
    @albums= Work.albums
    @movies = Work.movies
  end
end
