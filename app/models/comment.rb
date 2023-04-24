class Comment < ApplicationRecord
  belongs_to :post
  before_create :vote
  has_many :replies
  def vote
    self.votes = []
  end

end
