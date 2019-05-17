require 'rails_helper'

describe '書籍', type: :system do
  let!(:book_a) { FactoryBot.create(:book, title: 'タイトルA') }
  let!(:book_b) { FactoryBot.create(:book, title: 'タイトルB') }
  let!(:category_a) { FactoryBot.create(:category, name: 'カテゴリA') }
  let!(:book_category_a) { FactoryBot.create(:book_category, book: book_a, category: category_a) }

  before do
    visit books_path
  end

  describe 'ログインしている時、いない時共通' do
    context '書籍一覧画面' do
      it '書籍が表示される' do
        expect(page).to have_selector('.masonry-item', count: 2)
      end

      it '書籍詳細が表示される' do
        first('.show-book').click
        sleep 2.0
        expect(page).to have_content book_a.author
      end

      it '書籍タイトルで検索できる' do
        fill_in 'q[title_cont]', with: 'タイトルA'
        first('.fa-search').click
        sleep 1.0
        expect(page).to have_content '検索結果1件'
      end

      it '書籍カテゴリで検索できる' do
        visit root_path
        select 'カテゴリA', from: 'q_categories_id_eq'
        first('.fa-search').click
        sleep 1.0
        expect(page).to have_content '検索結果1件'
        first('.show-book').click

      end
    end
  end

  describe 'ログインしていない時' do
    context '書籍一覧画面' do
      it 'いいねボタンが表示されない' do
        expect(page).not_to have_selector '.upvote-button'
      end
    end
  end
end
