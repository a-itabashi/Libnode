class UpvoteSerializer < ActiveModel::Serializer
  attributes :upvotes

  def upvotes
    {
      count: object.book.upvotes.count,
      recentry_user: User.where(id: Upvote.where(book_id: object.book).resentry_3_user).pluck(:image)
    }
  end
end
