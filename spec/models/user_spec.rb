require 'rails_helper'

RSpec.describe User, type: :model do
  it 'ユーザーを作成できる' do
    user = FactoryBot.create(:user)
    expect(user).to be_valid
  end

  it 'nameが空ならバリデーションが通らない' do
    user = FactoryBot.build(:user, name: '')
    user.valid?
    expect(user.errors[:name]).to include('を入力してください')
  end

  it 'emailが空ならバリデーションが通らない' do
    user = FactoryBot.build(:user, email: '')
    user.valid?
    expect(user.errors[:email]).to include('を入力してください')
  end

  it 'imageが空ならバリデーションが通らない' do
    user = FactoryBot.build(:user, image: '')
    user.valid?
    expect(user.errors[:image]).to include('を入力してください')
  end
end
