require 'rails_helper'

describe 'ログイン', type: :system do
  describe 'サイドバー' do
    before do
      visit root_path
    end

    describe 'ログインしていないとき' do
      it '蔵書一覧画面へのリンクが表示されている' do
        expect(page).to have_content '蔵書一覧'
      end

      it 'ランキング画面へのリンクが表示されている' do
        expect(page).to have_content 'ランキング'
      end

      it 'トレンド画面へのリンクが表示されている' do
        expect(page).to have_content 'トレンド'
      end

      it 'Googleログイン用のロゴが表示されている' do
        expect(page).to have_selector '.google-login-logo'
      end

      it '借りるモーダルへのリンクは表示されていない' do
        expect(page).not_to have_content '借りる'
      end

      it '返すモーダルへのリンクは表示されていない' do
        expect(page).not_to have_content '返す'
      end

      it 'マイページへのリンクは表示されていない' do
        expect(page).not_to have_content 'マイページ'
      end

      it 'ログアウトボタンは表示されていない' do
        expect(page).not_to have_content 'ログアウト'
      end

      it '管理者メニューは表示されていない' do
        expect(page).not_to have_content '管理者メニュー'
      end

      it '借りている本は表示されていない' do
        expect(page).not_to have_content '借りている本'
      end
    end
    describe 'ログインしているとき' do
      it 'ログインできる' do
        click_on 'google-login-logo'
        sleep 1.0
        expect(current_path).to eq root_path
      end
    end
  end
end
