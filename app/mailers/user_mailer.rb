class UserMailer < ActionMailer::Base
  default from: "volunteer.24hhh@gmail.com"

  def confirm_email(profile)
    @profile = profile
    @confirm_url = "http://twofourhell.herokuapp.com/confirm/#{profile.confirm_token}"
    mail(:to => profile.email, :subject => "[24HHH] Please Confirm Your Email Address")
  end
end
