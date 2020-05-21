class Work < ApplicationRecord
  has_many :votes
  has_many :users, through: :votes
  validates :title, presence: true, uniqueness: {scope: :category}


  def self.books
    Work.where(category: :book).left_joins(:votes).group(:id).order('COUNT(votes) DESC, TITLE ASC')
  end

  def self.albums
    Work.where(category: :album).left_joins(:votes).group(:id).order('COUNT(votes) DESC, TITLE ASC')
  end

  def self.movies
    Work.where(category: :movie).left_joins(:votes).group(:id).order('COUNT(votes) DESC, TITLE ASC')
  end

  def self.spotlight
    Work.left_joins(:votes).group(:id).order('COUNT(votes) DESC, TITLE ASC').limit(1).first
  end
 
end
