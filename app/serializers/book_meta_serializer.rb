class BookMetaSerializer < ActiveModel::Serializer
  attributes :params

  def params
    {
      "title": object.title,
      "author": object.author,
      "saled_at": saled_at_formetter,
      "price": object.item_price,
      "description": object.item_caption,
      "image": object.large_image_url
    }
  end

  def saled_at_formetter
    if %w[年 月 日].all? { |i| object.sales_date.include?(i) }
      Time.strptime(object.sales_date, '%Y年%m月%d日').strftime('%Y-%m-%d')
    elsif %w[年 月].all? { |i| object.sales_date.include?(i) }
      Time.strptime(object.sales_date, '%Y年%m月').strftime('%Y-%m')
    end
  end
end
