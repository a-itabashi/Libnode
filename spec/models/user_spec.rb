require 'rails_helper'

RSpec.describe User, type: :model do
  it 'nameが空ならバリデーションが通らない' do
    user = FactoryBot.build(:user, name: '')
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it 'emailが空ならバリデーションが通らない' do
    user = FactoryBot.build(:user, email: '')
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it 'imageが空ならバリデーションが通らない' do
    user = FactoryBot.build(:user, image: '')
    user.valid?
    expect(user.errors[:image]).to include("can't be blank")
  end

  it 'adminが空ならバリデーションが通らない' do
    user = FactoryBot.build(:user, admin: '')
    user.valid?
    # expect(user.errors[:admin]).to include("can't be blank")
  end
end
