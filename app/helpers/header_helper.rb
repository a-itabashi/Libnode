module HeaderHelper
  def header_selector
    if controller.controller_name == 'books' && controller.action_name == 'index' \
      || controller.controller_name == 'books' && controller.action_name == 'edit'
      'header_with_searchbox'
    else
      'header'
    end
  end
end
