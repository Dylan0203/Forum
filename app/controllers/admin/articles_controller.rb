class Admin::ArticlesController < ApplicationController

  before_action :authenticate_user!

  layout "admin"

  def index
    @articles = Article.page(params[:page]).per(5)
  end

  def show
    @page_title = @article.topic
    @comments = @article.comments

    if params[:comment_id]
      @comment = Comment.find(params[:comment_id])
    else
      @comment = Comment.new
    end
    
  end


end
