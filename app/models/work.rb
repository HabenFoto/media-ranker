class Work < ApplicationRecord
  has_many :votes
  has_many :users, through: :votes
  validates :title, presence: true, uniqueness: {scope: :category}
  


  def self.books 
    Work.where(category: :book)
  end

  def self.albums
    Work.where(category: :album)
  end

  def self.movies
    Work.where(category: :movie)
  end

end
