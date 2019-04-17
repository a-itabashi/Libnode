class BookSerializer < ActiveModel::Serializer
  attributes :title, :author, :saled_at, :description, :image

  has_many :categories
  has_many :places
  has_many :upvotes

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
end
