class BookMetaSerializer < ActiveModel::Serializer
  attributes :params

  def params
    {
      "title": object.title,
      "author": object.author,
      "saled_at": Time.strptime(object.sales_date, '%Y年%m月%d日')
                  .strftime('%Y-%m-%d'),
      "price": object.item_price,
      "description": object.item_caption,
      "image": object.large_image_url
    }
  end
end
