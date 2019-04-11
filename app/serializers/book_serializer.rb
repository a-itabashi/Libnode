class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :saled_at, :price, :description, :image, :borrowed_num
end
