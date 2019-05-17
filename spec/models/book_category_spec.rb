require 'rails_helper'

RSpec.describe BookCategory, type: :model do
  let!(:book) { FactoryBot.create(:book) }
  let!(:category) { FactoryBot.create(:category) }
  let!(:category_2) { FactoryBot.create(:category) }

  it '書籍-カテゴリ中間テーブルを作成できる' do
    book_category = FactoryBot.create(:book_category, book_id: book.id, category_id: category.id)
    expect(book_category).to be_valid
  end

  it '特定の本とカテゴリの組み合わせは複数存在しない' do
    book_category_1 = FactoryBot.create(:book_category, book_id: book.id, category_id: category.id)
    book_category_2 = FactoryBot.build(:book_category, book_id: book.id, category_id: category.id)
    expect(book_category_2).not_to be_valid
  end
end
