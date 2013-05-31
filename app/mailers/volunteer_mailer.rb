class VolunteerMailer < ActionMailer::Base
  default from: "volunteer.24hhh@gmail.com"

  def notify_organizer(volunteer)
    @volunteer = volunteer
    mail(to: 'volunteer.24hhh@gmail.com', subject: 'New Volunteer Application')
  end


end
