class SignupController < ApplicationController
  def new
  	@profile = Profile.new
  end

  def create
    # Open May 31
  	@profile = Profile.new(profile_params)
    @profile.status = "unconfirmed"

  	if @profile.save
      session[:profile_id] = @profile.id
      redirect_to profile_complete_path
  	else
  		render "new"
  	end
  end

  def faker
    profile = Profile.find(params[:id])
    session[:profile_id] = profile.id
    render text: 'done', layout: false
  end

  def complete
  end

  def confirm
    @profile = Profile.where('confirm_token = ?', params[:ct]).first

    if @profile.present?
      session[:profile_id] = @profile.id
      @profile.status = "confirmed"
      @profile.save
      flash[:notice] = "Great! Your email address has been confirmed!"
      redirect_to new_volunteer_path
    else
      render file: 'public/404.html', status: 404, layout: false
    end
  end

  private
    def profile_params
      params.require(:profile).permit(:name, :email, :mobile, :tshirt_size, :age_group)
    end
end
