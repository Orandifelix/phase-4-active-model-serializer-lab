class TagSerializer < ActiveModel::Serializer
 attributes :name, :posts

  # def posts
  #   object.posts.pluck(:title)
  # end
  def posts
    self.object.posts.map do |post|
      {
        title: post.title
      }
    end
end
end
