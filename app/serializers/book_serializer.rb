class BookSerializer < ActiveModel::Serializer
  attributes :title, :author, :saled_at, :description, :image,
              :upvotes, :available

  has_many :categories
  has_many :places

  def categories
    object.categories.map(&:name)
  end

  def places
    object.places.map do |place|
      {
        shelf: place.shelf,
        column: place.column,
        row: place.row
      }
    end
  end

  def upvotes
    object.upvotes.length
  end

  def available
    object.borrow_lists.map(&:is_return).include?(false) ? false : true
  end
end
