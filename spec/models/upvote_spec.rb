require 'rails_helper'

RSpec.describe Upvote, type: :model do
  let!(:book_a) { FactoryBot.create(:book) }
  let!(:user_a) { FactoryBot.create(:user) }

  it 'いいねができる' do
    upvote = FactoryBot.create(:upvote, book_id: book_a.id, user_id: user_a.id)
    expect(upvote).to be_valid
  end

  it '同じ書籍に2回いいねはできない' do
    upvote = FactoryBot.create(:upvote, book_id: book_a.id, user_id: user_a.id)
    second_upvote = FactoryBot.build(:upvote, book_id: book_a.id, user_id: user_a.id)
    expect(second_upvote).not_to be_valid
  end
end
