class ReplySerializer
  include FastJsonapi::ObjectSerializer
  belongs_to :comment
  attributes :message, :votes, :comment, :user, :created_at, :updated_at
  
end
