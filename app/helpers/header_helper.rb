module HeaderHelper
  def header_selector
    if controller.controller_name == 'books' && controller.action_name == 'index' \
      || controller.controller_name == 'books' && controller.action_name == 'edit'
      render(partial: 'layouts/header/header_with_searchbox')

    elsif controller.controller_name == 'trends'
      render(partial: 'layouts/header/header',
             locals: { icon_type: 'fas',
                       icon: 'angle-double-up',
                       title: 'トレンドページ',
                       caption: 'Amazon技術書ランキングから旬の技術書をご紹介' })
    elsif controller.controller_name == 'rankings'
      render(partial: 'layouts/header/header',
             locals: { icon_type: 'fas',
                       icon: 'crown',
                       title: 'ランキングページ',
                       caption: '' })
    elsif controller.controller_name == 'registrations' && controller.action_name == 'new' \
      || controller.controller_name == 'import_csvs' && controller.action_name == 'new'
      render(partial: 'layouts/header/header',
             locals: { icon_type: 'fas',
                       icon: 'book-open',
                       title: '蔵書登録ページ',
                       caption: '書籍情報をLibnodeに新規登録！' })
    end
  end
end
