require 'rails_helper'

RSpec.describe BookPlace, type: :model do
  it '同じ本に複数のplaceが紐付かない' do
    book_place_1 = FactoryBot.build(:book_place)
    book_place_2 = FactoryBot.build(:book_place, place_id: 2)
    expect(book_place_2).not_to be_valid
  end
end
