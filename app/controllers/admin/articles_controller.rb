class Admin::ArticlesController < ApplicationController

  before_action :authenticate_user!

  layout "admin"

  def index
    @articles = Article.page(params[:page]).per(5)
  end

end
