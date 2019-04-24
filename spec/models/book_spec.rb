require 'rails_helper'

RSpec.describe Book, type: :model do
  it 'titleが空ならバリデーションが通らない' do
    book = FactoryBot.build(:book, title: '')
    book.valid?
    expect(book.errors[:title]).to include("can't be blank")
  end
end
