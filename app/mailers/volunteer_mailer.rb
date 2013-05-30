class VolunteerMailer < ActionMailer::Base
  default from: "24hhhvolunteer@gmail.com"

  def notify_organizer(volunteer)
    @volunteer = volunteer
    mail(to: '24hhhvolunteer@gmail.com', subject: 'New Volunteer Application')
  end


end
