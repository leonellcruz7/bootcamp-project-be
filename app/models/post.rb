class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
before_create :vote
  def vote
    self.votes = 0
  end
end
