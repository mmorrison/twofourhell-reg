class SignupController < ApplicationController
  def new
  	@profile = Profile.new
  end

  def create
    # Open May 31
  	@profile = Profile.new(profile_params)

  	if @profile.save
      session[:profile_id] = @profile.id
      flash[:notice] = "You're profile was created successfully. Please check your email."
      redirect_to profile_complete_path
  	else
  		render "new"
  	end
  end

  def faker
    profile = Profile.find(1)
    session[:profile_id] = profile.id
    render text: 'done', layout: false
  end

  def complete
  end

  def confirm
    @profile = Profile.where('confirm_token = ?', params[:ct])

    if @profile.present?
      session[:profile_id] = @profile.id
      flash[:success] = "Great! You're email address has been confirmed!"
      redirect_to volunteer_signup_path
    else
      render file: 'public/404.html', status: 404, layout: false
    end
  end

  private
    def profile_params
      params.require(:profile).permit(:name, :email, :mobile, :tshirt_size, :age_group)
    end
end
