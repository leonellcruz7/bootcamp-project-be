class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :firstname, :lastname, :username, :email, :posts, :id
  has_many :posts
end
