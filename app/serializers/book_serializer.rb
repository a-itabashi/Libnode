class BookSerializer < ActiveModel::Serializer
  attributes :title, :author, :saled_at, :description, :image,
             :available

  has_many :categories
  has_many :places
  has_many :upvotes

  def saled_at
    object.saled_at.strftime('%Y-%m-%d') if object.saled_at.present?
  end

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
    {
      is_push: object.upvotes.where(user_id: current_user.id).empty?,
      count: object.upvotes.length,
      recentry_user: User.where(id: object.upvotes.order(created_at: :desc).limit(3).pluck(:user_id)).pluck(:image)
    }
  end

  def available
    object.borrow_lists.map(&:is_return).all?
  end

  def image
    object.image.presence || object.image_raw_url
  end
end
