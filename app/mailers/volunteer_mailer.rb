class VolunteerMailer < ActionMailer::Base
  default from: "volunteer.24hhh@gmail.com"

  def notify_organizer(volunteer)
    @volunteer = volunteer
    mail(to: 'volunteer.24hhh@gmail.com', subject: 'New Volunteer Application')
  end

  def confirmation(volunteer)
    mail(to: volunteer.profile.email, subject: '[24HHH] Volunteer Application Confirmation')
  end


end
