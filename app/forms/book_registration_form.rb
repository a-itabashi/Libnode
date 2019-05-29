class BookRegistrationForm
  include ActiveModel::Model

  concerning :BookBuilder do
    def book
      @book ||= Book.new
    end
  end

  concerning :CategoriesBuilder do
    attr_reader :categories_attributes

    def categories
      @cateogries_attributes ||= Category.new
    end

    def categories_attributes=(attributes)
      attr_arr = attributes[:name].split(',')
      @cateogries_attributes = attr_arr.map { |c| Category.find_or_initialize_by(name: c) }
    end
  end

  concerning :PlacesBuilder do
    attr_reader :places_attributes

    def places
      @places_attributes ||= Place.new
    end

    def places_attributes=(attributes)
      @places_attributes = Place.new(attributes)
    end
  end

  attr_accessor :title, :author, :saled_at, :price, :description, :image, :image_raw_url

  def save
    book.assign_attributes(book_params)
    build_informations
    {
      success: !!book.save,
      errors: book.errors.full_messages
    }
  end

  private

  def book_params
    {
      title: title,
      author: author,
      saled_at: saled_at,
      price: price,
      description: description,
      image: image,
      image_raw_url: image_raw_url
    }
  end

  def build_informations
    book.categories << categories
    book.places << places
  end
end
