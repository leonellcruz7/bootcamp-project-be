class Comment < ApplicationRecord
  belongs_to :post
  before_create :vote

  def vote
    self.votes = 0
  end

end
