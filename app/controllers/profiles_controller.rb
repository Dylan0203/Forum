class ProfilesController < ApplicationController

  before_action :authenticate_user!, :except => [:show]

  def show
    @user = User.find(params[:id])

    @profile = @user.get_profile
  end

  def edit
    @user = current_user

    @profile = @user.get_profile
  end

  def update
    @profile = current_user.profile


  end

  protected

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :phone, :description)
  end
end
