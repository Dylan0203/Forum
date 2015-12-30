class ProfilesController < ApplicationController

  before_action :authenticate_user!, :except => [:show]

  def show
    @user = User.find(params[:id])
    @articles = @user.articles
    @profile = @user.get_profile
    @reply = Article.where(id: @user.comments.pluck(:article_id).uniq)
  end

  def edit
    @user = current_user

    @profile = @user.get_profile
  end

  def update
    @profile = current_user.profile

    if @profile.update(profile_params)
      redirect_to profile_path
    else
      render :action => :edit
    end

  end

  protected

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :phone, :description)
  end
end
