module CrudFormHelper
  include Core::ApplicationHelper

  # -------------------------------------------------------------------------
  # Public Methods...
  # -------------------------------------------------------------------------
  def errors
    render :partial => 'crud/errors'
  end

  def nested_errors(filtered = [])
    render :partial => 'crud/nested_errors', :locals => {:filtered => filtered}
  end

  def submit(a_form)
    render :partial => 'crud/submit', :locals => {:f => a_form}
  end

  # -------------------------------------------------------------------------
  # Simple Fields...
  # -------------------------------------------------------------------------

  def checkbox(a_form, a_field_name, a_style_class = '')
    nested_text a_form, a_field_name, @entity_name, a_style_class
  end

  def nested_checkbox(a_form, a_field_name, an_entity_name = @entity_name, a_style_class = '')
    render args(:check_box, a_form, a_field_name, an_entity_name, a_style_class)
  end

  def mail(a_form, a_field_name, a_style_class = '')
    nested_mail a_form, a_field_name, @entity_name, a_style_class
  end

  def nested_mail(a_form, a_field_name, an_entity_name = @entity_name, a_style_class = '')
    render args(:mail, a_form, a_field_name, an_entity_name, a_style_class)
  end

  def number(a_form, a_field_name, a_style_class = '')
    nested_number a_form, a_field_name, @entity_name, a_style_class
  end

  def nested_number(a_form, a_field_name, an_entity_name = @entity_name, a_style_class = '')
    render args(:number, a_form, a_field_name, an_entity_name, a_style_class)
  end

  def text(a_form, a_field_name, a_style_class = '')
    nested_text a_form, a_field_name, @entity_name, a_style_class
  end

  def nested_text(a_form, a_field_name, an_entity_name = @entity_name, a_style_class = '')
    render args(:text, a_form, a_field_name, an_entity_name, a_style_class)
  end

  def big_text(a_form, a_field_name, a_style_class = '')
    nested_big_text a_form, a_field_name, @entity_name, a_style_class
  end

  def nested_big_text(a_form, a_field_name, an_entity_name = @entity_name, a_style_class = '')
    render args(:text_area, a_form, a_field_name, an_entity_name, a_style_class)
  end

  def datepicker(a_form, a_field_name, a_style_class = '')
    nested_datepicker a_form, a_field_name, @entity_name, a_style_class
  end

  def nested_datepicker(a_form, a_field_name, an_entity_name = @entity_name, a_style_class = 'input-date')
    render args(:date, a_form, a_field_name, an_entity_name, a_style_class)
  end

  def select_box(a_form, a_field_name, values, a_style_class = '')
    nested_select_box(a_form, a_field_name, values, @entity_name, a_style_class)
  end

  def nested_select_box(a_form, a_field_name, values, an_entity_name = @entity_name, a_style_class = '')
    render select_args(:select, a_form, a_field_name, values, an_entity_name, a_style_class)
  end

  # -------------------------------------------------------------------------
  # Association Fields...
  # -------------------------------------------------------------------------

  def select_one(a_form, a_field_name, a_style_class = '')
    nested_select_one(a_form, a_field_name, @entity_name, a_style_class)
  end

  def nested_select_one(a_form, a_field_name, an_entity_name = @entity_name, a_style_class = '')
    render args(:one, a_form, a_field_name, an_entity_name, a_style_class)
  end

  # -------------------------------------------------------------------------
  # Private Methods...
  # -------------------------------------------------------------------------
  private
    def args(a_view, a_form, a_field_name, an_entity_name, a_style_class)
      field_label = translate_attribute an_entity_name, a_field_name
      {:partial => "crud/#{a_view}", :locals => {:form => a_form, :field_name => a_field_name, :field_label => field_label, :style_class => a_style_class} }
    end

    def select_args(a_view, a_form, a_field_name, values, an_entity_name, a_style_class)
      field_label = translate_attribute an_entity_name, a_field_name
      {:partial => "crud/#{a_view}", :locals => {:form => a_form, :field_name => a_field_name, :field_label => field_label, :style_class => a_style_class, :values => values.sort} }
    end
end
