class UserMailer < ActionMailer::Base
  default from: "info@aesoft.cz"

  def welcome_email(user)
    @user = user
    @url  = 'http://aesoft.cz'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
