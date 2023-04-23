class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
before_create :vote
  def vote
    self.votes = 0
  end
end
