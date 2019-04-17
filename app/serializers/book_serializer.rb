class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :saled_at, :price, :description, :image, :borrowed_num

  has_many :categories
  has_many :places
  has_many :upvotes

  def categories
    object.categories.map(&:name)
  end

  def places
    object.places.map do |place|
      "棚: #{place.shelf} 行: #{place.row} 列: #{place.column}"
    end
  end

  def upvotes
    object.upvotes.length
  end
end
