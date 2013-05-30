class VolunteersController < ApplicationController

  before_filter :get_profile

  def new
    @volunteer = Volunteer.new
    @volunteer_app = VolApplication.new
  end

  def create
    @volunteer = Volunteer.new(volunteer_params)
    @volunteer.profile_id = session[:profile_id]

    if @volunteer.save
      @volunteer_app = VolApplication.new
      @volunteer_app.year = DateTime.now.year
      @volunteer_app.preferred_teammates = params[:vol_application][:preferred_teammates].split(',') # TODO: Add regex for better matching
      @volunteer_app.event_availability = params[:volunteer][:event_availability]
      @volunteer_app.preferred_teams = params[:volunteer][:preferred_teams]
      @volunteer_app.years_volunteered = params[:volunteer][:years_volunteered]

      if @volunteer_app.save
        flash[:success] = 'Thanks for applying to volunteer! We\'ll contact you if you made the cut!'
        VolunteerMailer.notify_organizer(@volunteer).deliver
        redirect_to thankyou_path and return
      else
        @errors = @volunteer_app.errors
        render action: "new" and return
      end
    else
      @errors = @volunteer.errors
      @errors.merge @volunteer_app.errors
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