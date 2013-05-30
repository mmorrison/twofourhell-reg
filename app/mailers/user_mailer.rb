class UserMailer < ActionMailer::Base
  default from: "24hhhvolunteer@gmail.com"

  def confirm_email(profile)
    @profile = profile
    @confirm_url = "http://twofourhell-volunteer.herokuapp.com/confirm/#{profile.confirm_token}"
    mail(:to => profile.email, :subject => "[24HHH] Please Confirm Your Email Address")
  end
end
