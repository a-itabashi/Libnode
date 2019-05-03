module HeaderHelper
  def need_header?
    if controller.controller_name == 'books' && controller.action_name == 'index' \
      || controller.controller_name == 'books' && controller.action_name == 'edit'
      true
    else
      false
    end
  end
end
