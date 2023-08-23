# class AuthorPostSerializer < ActiveModel::Serializer
#   attributes :title, :short_content, :tags
 
#   def short_content
#     "#{self.object.content[0..39]}..."
#   end

#   def tags
#     self.object.tags.pluck(:name)
#   end
# end

class AuthorPostSerializer < ActiveModel::Serializer
  attributes :title, :short_content, :tags

  def short_content
    "#{self.object.content[0..39]}..."
  end

  # def tags
  #   self.object.tags.pluck(:name)
  # end
  def tags
    self.object.tags.map do |tag|
      {
        name: tag.name
      }
    end
end

  def posts
    self.object.posts.map do |post|
      {
        title: post.title,
        short_content: post.short_content,
        tags: post.tags.pluck(:name)
      }
    end
  end
end