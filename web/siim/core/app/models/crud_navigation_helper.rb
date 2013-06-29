module CrudNavigationHelper

  # -------------------------------------------------------------------------
  # Public Methods...
  # -------------------------------------------------------------------------
  def back_button(a_path)
    crud_button a_path, :back, 'icon-arrow-left'
  end

  def create_button(a_path)
    crud_button a_path, :create, 'icon-plus'
  end

  def edit_button(a_path)
    crud_button a_path, :edit, 'icon-edit'
  end

  def remove_button(a_path)
    render :partial => 'crud/remove_button', :locals => {:path => a_path}
  end

  def view_button(a_path)
    crud_button a_path, :show, 'icon-search'
  end

  def button(a_path, a_label, a_style)
    render :partial => 'crud/button', :locals => {:path => a_path, :label => a_label, :style_class => a_style}
  end

  # -------------------------------------------------------------------------
  # Private Methods...
  # -------------------------------------------------------------------------
  private
    def crud_button(a_path,an_action_name,a_style_name)
      button a_path, t(action_key(an_action_name)), action_style(a_style_name)
    end

    def action_key(an_action_name)
      "actions.#{an_action_name}"
    end

    def action_style(a_style_name)
      "#{a_style_name} icon-white"
    end
end
