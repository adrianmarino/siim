module CrudFormHelper
  # -------------------------------------------------------------------------
  # Public Methods...
  # -------------------------------------------------------------------------
  def errors
    render :partial => 'crud/errors'
  end

  def submit(a_form)
    render :partial => 'crud/submit', :locals => {:f => a_form}
  end

  # -------------------------------------------------------------------------
  # Simple Fields...
  # -------------------------------------------------------------------------

  def text(a_form, a_field_name, an_entity_name = @entity_name)
    render args(:text, a_form, a_field_name, an_entity_name)
  end

  def datepicker(a_form, a_field_name, an_entity_name = @entity_name)
    render args(:date, a_form, a_field_name, an_entity_name)
  end

  # -------------------------------------------------------------------------
  # Association Fields...
  # -------------------------------------------------------------------------

  def one_select(a_form, a_field_name, an_entity_name = @entity_name )
    render args(:one, a_form, a_field_name, an_entity_name)
  end

  # -------------------------------------------------------------------------
  # Private Methods...
  # -------------------------------------------------------------------------
  private
    def args(a_view, a_form, a_field_name, an_entity_name)
      field_label = translate_attribute an_entity_name, a_field_name
      {:partial => "crud/#{a_view}", :locals => {:form => a_form, :field_name => a_field_name, :field_label => field_label} }
    end
end
