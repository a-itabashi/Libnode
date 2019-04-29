class UpvoteSerializer < ActiveModel::Serializer
  attributes :count

  def count
    object.blank? ? 0 : object.book.upvotes.count
  end
end
