class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([\w\d\.]+)@((?:[-a-z0-9]+\.)+[a-z]{2,3})\z/i
      record.errors[attribute] << (options[:message] || I18n.t('email.invalid'))
    end
  end
end