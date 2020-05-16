class PagesController < ApplicationController

  def index
    @works = Work.all
    @books = Work.select{ |work| work.category == "book" }
    @albums = Work.select{ |work| work.category == "album" }
    @movies = Work.select{ |work| work.category == "movie" }
  end
end
