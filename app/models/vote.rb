class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :work
  validates :user_id, presence: true, uniqueness: {scope: :work_id} # can't vote for same work twice

end
