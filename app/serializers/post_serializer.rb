class PostSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :body, :votes, :user_id, :tags, :created_at, :updated_at, :user, :id, :comments, :downcase_title
  belongs_to :user
  has_many :comments
end
