class PostSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :content, :image_url, :title

  has_many :comments

end
