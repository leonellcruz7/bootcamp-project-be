class Reply < ApplicationRecord
  belongs_to :comment
  before_create :reply_vote
  def reply_vote
    self.votes = []
  end
end
