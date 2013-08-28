module PhotoHelper
  # -------------------------------------------------------------------------
  # Public Methods...
  # -------------------------------------------------------------------------
  def photo_field(a_form, a_field_name, an_entity_name)
    label_name = translate_attribute an_entity_name, a_field_name
    render :partial => "photo/edit", :locals => {:form => a_form, :field_name => a_field_name, :label_name => label_name}
  end

  def show_photo(an_url)
    render  :partial => "photo/show", :locals => { :url => an_url }
  end
end