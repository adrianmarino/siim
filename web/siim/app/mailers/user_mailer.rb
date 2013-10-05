class UserMailer < ActionMailer::Base
  default from: "siim.bambusolutions@gmail.com"
  # -------------------------------------------------------------------------
  # Public Methods...
  # -------------------------------------------------------------------------
  def inscription_at_system_mailer(user)
    @user = user
 

    mail to: @user.email, subject: t(:inscription_at_integral_system_medical_information)
  end

end
