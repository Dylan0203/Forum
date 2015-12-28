class ArticleCommentsController < ApplicationController

  before_action :authenticate_user!

  before_action :set_article

  def create
    
    #@comment = current_user.comments.new(comment_params)
    #@comment.article = @article
    @comment = @article.comments.build(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to article_path(@article)
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to article_path(@article)
  end


  def destroy
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end


  private

  def comment_params
    params.require(:comment).permit(:reply)
  end

  def set_article
    @article = Article.find(params[:article_id])
  end
end
