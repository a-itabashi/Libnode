require 'rails_helper'

describe 'ログイン', type: :system do
  describe 'サイドバー' do
    describe 'ログインしていないとき' do
      it '蔵書一覧画面に遷移' do
        visit root_path
        click_link '蔵書一覧'
        expect(page).to have_content '蔵書一覧'
      end

      # it '借りるモーダルを表示できる' do
      #   visit root_path
      #   find('.borrow-button').click
      #   expect(page).to have_content '本を借りる'
      # end

      # it '返すモーダルを表示できる' do
      #   visit root_path
      #   find('.return-button').click
      #   expect(page).to have_content '本を返す'
      # end

      # it '書籍登録画面に遷移できる' do
      #   visit root_path
      #   click_button '管理者メニュー'
      #   click_button '蔵書登録'
      #   expect(page).to have_content '書籍登録画面'
      # end

      it 'Googleログイン用のロゴが表示されている' do
        visit root_path
        expect(page).to have_selector '.google-login-logo'
      end

      it 'マイページへのリンクは表示されていない' do
        visit root_path
        expect(page).not_to have_content 'マイページ'
      end

      it 'ログアウトボタンは表示されていない' do
        visit root_path
        expect(page).not_to have_content 'ログアウト'
      end

      it '借りている本は表示されていない' do
        visit root_path
        expect(page).not_to have_content '借りている本'
      end
    end
    describe 'ログインしているとき' do
      it 'ログインできる' do
        visit root_path
        click_on 'google-login-logo'
        sleep 1.0
        expect(current_path).to eq root_path
      end
    end
  end
end
