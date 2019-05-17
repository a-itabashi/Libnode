require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'カテゴリを作成できる' do
    category = FactoryBot.create(:category)
    expect(category).to be_valid
  end

  it 'nameが空ならバリデーションが通らない' do
    category = FactoryBot.build(:category, name: '')
    category.valid?
    expect(category.errors[:name]).to include('を入力してください')
  end
end
