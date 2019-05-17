require 'rails_helper'

RSpec.describe BorrowList, type: :model do
  let!(:book_a) { FactoryBot.create(:book) }
  let!(:user_a) { FactoryBot.create(:user) }

  it '本を借りることができる' do
    borrow_list = FactoryBot.create(:borrow_list, user_id: user_a.id, book_id: book_a.id)
    expect(borrow_list).to be_valid
  end

  it '既に借りられている本は借りることができない' do
    first_borrow_list = FactoryBot.create(:borrow_list, user_id: user_a.id, book_id: book_a.id)
    second_borrow_list = FactoryBot.build(:borrow_list, user_id: user_a.id, book_id: book_a.id)
    expect(second_borrow_list).not_to be_valid
  end

  it '本を返すことができる' do
    borrow_list = FactoryBot.create(:borrow_list, user_id: user_a.id, book_id: book_a.id)
    expect { borrow_list.destroy }.to change { BorrowList.count }.by(-1)
  end

  it 'user_idが空の場合バリデーションが通らない' do
    borrow_list = FactoryBot.build(:borrow_list, book_id: book_a, user_id: '')
    borrow_list.valid?
    expect(borrow_list.errors[:user_id]).to include('を入力してください')
  end

  it '返却日が空の場合バリデーションが通らない' do
    borrow_list = FactoryBot.build(:borrow_list, return_date: '')
    borrow_list.valid?
    expect(borrow_list.errors[:return_date]).to include('を入力してください')
  end

  it '返却日が過去ならバリデーションが通らない' do
    borrow_list = FactoryBot.build(:borrow_list, return_date: '1000/1/1')
    borrow_list.valid?
    expect(borrow_list.errors[:error]).to include('過去の日付は表示できません')
  end
end
