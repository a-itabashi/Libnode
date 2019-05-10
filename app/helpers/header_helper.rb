module HeaderHelper
  def header_selector
    case controller.controller_name

    when 'books'
      if controller.action_name == 'index' || controller.action_name == 'edit'
        render(partial: 'layouts/header/header_with_searchbox')
      end
    when 'rankings'
      render(partial: 'layouts/header/header',
             locals: { icon_type: 'fas',
                       icon: 'crown',
                       title: 'ランキングページ',
                       caption: '' })
    when 'trends'
      render(partial: 'layouts/header/header',
             locals: { icon_type: 'fas',
                       icon: 'angle-double-up',
                       title: 'トレンドページ',
                       caption: 'Amazon技術書ランキングから旬の技術書をご紹介' })
    when 'registrations', 'import_csvs'
      render(partial: 'layouts/header/header',
             locals: { icon_type: 'fas',
                       icon: 'book-open',
                       title: '蔵書登録ページ',
                       caption: '書籍情報をLibnodeに新規登録！' })
    else
      return
    end
  end
end
