require 'rails_helper'

RSpec.describe BookCategory, type: :model do
  it "特定の本とカテゴリの組み合わせは複数存在しない" do
    book_category_1 = FactoryBot.build(:book_category)
    book_category_2 = FactoryBot.build(:book_category)
    expect(book_category_2).not_to be_valid
  end
end
