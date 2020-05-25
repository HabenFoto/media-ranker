class PagesController < ApplicationController
  def index
    @books = Work.books.limit(10)
    @albums = Work.albums.limit(10)
    @movies = Work.movies.limit(10)
    @spotlight = Work.spotlight
  end
end
