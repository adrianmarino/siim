module Core
  module AvatarHelper
    # -------------------------------------------------------------------------
    # Public Methods...
    # -------------------------------------------------------------------------
    def avatar_field(a_form, a_field_name, an_entity_name)
      label_name = translate_attribute an_entity_name, a_field_name
      render :partial => "avatar/edit", :locals => {:form => a_form, :field_name => a_field_name, :label_name => label_name}
    end

    def show_avatar(an_url)
      render  :partial => "avatar/show", :locals => { :url => an_url }
    end
  end
end