class VolunteersController < ApplicationController

  before_filter :get_profile

  def new
    @volunteer = Volunteer.new
    @volunteer_app = VolApplication.new
  end

  def create
    @volunteer = Volunteer.new(volunteer_params)

    certifications = []
    certifications << params[:volunteer][:certifications] unless params[:volunteer][:certifications].nil?
    certifications << params[:volunteer][:certifications_other].split(',') unless params[:volunteer][:certifications_other].nil?

    @volunteer.profile_id = session[:profile_id]
    @volunteer.years_volunteered = params[:volunteer][:years_volunteered]
    @volunteer.certifications = certifications
    @volunteer.equipment = params[:volunteer][:equipment]

    @volunteer_app = VolApplication.new
    @volunteer_app.year = DateTime.now.year
    @volunteer_app.preferred_teammates = params[:vol_application][:preferred_teammates].split(',') # TODO: Add regex for better matching
    @volunteer_app.event_availability = params[:vol_application][:event_availability]
    @volunteer_app.preferred_teams = params[:vol_application][:preferred_teams]
    @volunteer_app.do_you_agree = params[:agreed]


    if @volunteer.save
      @volunteer_app.volunteer_id = @volunteer.id
      if @volunteer_app.save
        VolunteerMailer.notify_organizer(@volunteer).deliver
        VolunteerMailer.confirmation(@volunteer).deliver
        redirect_to thankyou_path and return
      else
        @errors = @volunteer_app.errors
        render action: "new" and return
      end
    else
      @errors = @volunteer.errors
      render action: "new" and return
    end
  end

  def thankyou
  end


  private

    def get_profile
      @profile = Profile.find(session[:profile_id])
    end

    def volunteer_params
      params.require(:volunteer).permit(
        :qualification,
        :years_volunteered,
        :certifications)
    end

end