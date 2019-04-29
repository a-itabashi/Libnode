class UpvoteSerializer < ActiveModel::Serializer
  attributes :count

  def count
    object.count
  end
end
