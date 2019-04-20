class BookMetaSerializer < ActiveModel::Serializer
  attributes :params

  def params
    {
      "title": object.title,
      "author": object.author,
      "saled_at": object.sales_date,
      "price": object.item_price,
      "description": object.item_caption,
      "image": object.large_image_url
    }
  end
end
