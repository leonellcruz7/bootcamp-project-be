class CommentSerializer
  include FastJsonapi::ObjectSerializer
  has_many :replies
  attributes :message, :post_id, :votes, :username, :replies
  belongs_to :post
end
