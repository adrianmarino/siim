module NavigationHelper

  # -------------------------------------------------------------------------
  # Public Methods...
  # -------------------------------------------------------------------------
  def back_button(a_path)
    crud_button a_path, :back, 'icon-chevron-left'
  end

  def create_button(a_path)
    crud_button a_path, :create, 'icon-plus-sign'
  end

  def edit_button(a_path)
    crud_button a_path, :edit, 'icon-edit'
  end

  def remove_button(a_path, a_confirm_question = t(:confirm))
    render :partial => 'crud/remove_button', :locals => {:path => a_path, :question => a_confirm_question}
  end

  def view_button(a_path)
    crud_button a_path, :show, 'icon-search'
  end

  def button(a_path, a_label, a_icon_style, a_style = '')
    render :partial => 'crud/button', :locals => {:path => a_path, :label => a_label, :icon_style_class => a_icon_style, :style_class => a_style}
  end

  # -------------------------------------------------------------------------
  # Private Methods...
  # -------------------------------------------------------------------------
  private
    def crud_button(a_path,an_action_name,a_icon_style_name, a_style = '')
      button a_path, t(action_key(an_action_name)), action_icon_style(a_icon_style_name), a_style
    end

    def action_key(an_action_name)
      "actions.#{an_action_name}"
    end

    def action_icon_style(a_icon_style_name)
      "#{a_icon_style_name}"
    end
end
