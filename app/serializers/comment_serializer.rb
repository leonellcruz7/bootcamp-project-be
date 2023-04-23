class CommentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :message, :post_id, :votes, :username
  belongs_to :post
end
