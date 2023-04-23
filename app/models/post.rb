class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
before_create :vote
before_save :downcase
  def vote
    self.votes = 0
  end
  def downcase
    self.downcase_title = title.downcase
  end
end
