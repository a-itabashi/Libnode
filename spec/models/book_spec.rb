require 'rails_helper'

RSpec.describe Book, type: :model do
  it '書籍を作成できる' do
    book = FactoryBot.create(:book)
    expect(book).to be_valid
  end

  it 'titleが空ならバリデーションが通らない' do
    book = FactoryBot.build(:book, title: '')
    book.valid?
    expect(book.errors[:title]).to include('は必ず入力してください')
  end

  it 'imageとimage_raw_urlが空の場合バリデーションが通らない' do
    book = FactoryBot.build(:book, image: '', image_raw_url: '')
    book.valid?
    expect(book.errors[:image]).to include('は必ず入力してください')
  end

  it 'imageが空で、image_raw_urlに値がある場合バリデーションをパスする' do
    book = FactoryBot.build(:book, image: '')
    book.invalid?
  end

  it 'image_raw_urlが空で、imageに値がある場合バリデーションをパスする' do
    book = FactoryBot.build(:book, image_raw_url: '')
    book.invalid?
  end

  it 'priceにマイナスの値を入れた場合、バリデーションが通らない' do
    book = FactoryBot.build(:book, price: '-10000')
    book.valid?
    expect(book.errors[:price]).to include('は0以上の値にしてください')
  end
end
