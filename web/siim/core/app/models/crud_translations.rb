module CrudTranslations

  def self.model_was_created(a_model)
    I18n.t('activerecord.successful.messages.created', :model => a_model.class.model_name.human)
  end

  def self.model_was_updated(a_model)
    I18n.t('activerecord.successful.messages.updated', :model => a_model.class.model_name.human)
  end

end
