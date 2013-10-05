class UserMailer < ActionMailer::Base
  default from: "siim.bambusolutions@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.confirmation_message.subject
  #
  def confirmation_message
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  #
  #
  def inscription_at_system_mailer(user)
    @user = user
 

    mail to: @user.email, subject: t(:inscription_at_integral_system_medical_information)
  end

end
