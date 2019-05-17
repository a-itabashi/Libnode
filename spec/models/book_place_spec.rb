require 'rails_helper'

RSpec.describe BookPlace, type: :model do
  let!(:book) { FactoryBot.create(:book) }
  let!(:place) { FactoryBot.create(:place) }
  let!(:place_2) { FactoryBot.create(:place) }

  it '書籍-場所中間テーブルを作成できる' do
    book_place = FactoryBot.create(:book_place, book_id: book.id, place_id: place.id)
    expect(book_place).to be_valid
  end

  it '同じ本に複数のplaceが紐付かない' do
    book_place_1 = FactoryBot.create(:book_place, book_id: book.id, place_id: place.id)
    book_place_2 = FactoryBot.build(:book_place, book_id: book.id, place_id: place_2.id)
    expect(book_place_2).not_to be_valid
  end
end
