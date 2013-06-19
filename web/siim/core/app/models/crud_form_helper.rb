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

  def text(a_form, a_field_name)
    render :partial => 'crud/text', :locals => {:f => a_form, :name => a_field_name}
  end

  def state_assoc_select(a_form, a_field_name)
    render :partial => 'crud/state_assoc', :locals => {:f => a_form, :name => a_field_name}
  end

  def one_assoc_select(a_form, a_field_name, all_assoc_entities = nil )
    render :partial => 'crud/one_assoc', :locals => {:f => a_form,  :name => a_field_name, :all => all_assoc_entities}
  end

  def many_assoc_select(a_form, a_field_name, all_assoc_entities, a_selected_ids)
    render :partial => 'crud/many_assoc', :locals => {:f => a_form, :name => a_field_name, :all => all_assoc_entities, :selected_ids => a_selected_ids}
  end

  def datepicker(a_form, a_field_name)
    render :partial => 'crud/date', :locals => {:f => a_form, :name => a_field_name}
  end
end