require 'rails_helper'

RSpec.describe Place, type: :model do
  it '場所情報を作成できる' do
    place = FactoryBot.create(:place)
    expect(place).to be_valid
  end

  it 'shelfが空ならバリデーションが通らない' do
    place = FactoryBot.build(:place, shelf: '')
    expect(place).not_to be_valid
  end

  it 'rowが空ならバリデーションが通らない' do
    place = FactoryBot.build(:place, row: '')
    expect(place).not_to be_valid
  end

  it 'columnが空ならバリデーションが通らない' do
    place = FactoryBot.build(:place, column: '')
    expect(place).not_to be_valid
  end
end
