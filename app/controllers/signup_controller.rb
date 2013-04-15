class SignupController < ApplicationController
  def new
  	@profile = Profile.new
  end

  def create
  	@profile = Profile.new(profile_params)

  	if @profile.save

  	else
  		render "new"
  	end
  end

  private
    def profile_params
      params.require(:profile).permit(:name, :email, :mobile, :tshirt_size, :age_group)
    end
end
