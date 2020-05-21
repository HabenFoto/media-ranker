class Work < ApplicationRecord
  has_many :votes
  has_many :users, through: :votes
  validates :title, presence: true, uniqueness: {scope: :category}
  
 # need to get the top most voted to spotlight

  def self.books
    Work.where(category: :book).left_joins(:users).group(:id).order('COUNT(users) DESC')
  end

  def self.albums
    Work.where(category: :album).left_joins(:users).group(:id).order('COUNT(users) DESC')
  end

  def self.movies
    Work.where(category: :movie).left_joins(:users).group(:id).order('COUNT(users) DESC')
  end
 
end
