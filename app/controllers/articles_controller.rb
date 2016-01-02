class ArticlesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  before_action :set_article, :only => [ :show ]

  before_action :set_my_article, :only => [:edit, :update, :destroy ]

  def about
  end

  def index

    if params[:keyword] || params[:category]
      
      if params[:category][:id].blank?
        @articles = Article.where([ "topic like ?", "%#{params[:keyword]}%"])
      else
        @category = Category.find(params[:category][:id])
        @articles = @category.articles
        @articles = @articles.where([ "topic like ?", "%#{params[:keyword]}%"])
      end
    else
      @articles = Article.all
    end

    if %w[topic comments_count last_comment_time view].include?(params[:order])
      sort_by = (params[:order])
    else
      sort_by = 'id'
    end
    
#    if params[:category]
#      if params[:category][:id].blank?
#          redirect_to articles_path
#      else
#        @category = Category.find(params[:category][:id])
#        @articles = @category.articles
#      end
#    end

      @articles = @articles.order(sort_by + " DESC").page(params[:page]).per(5)
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)

    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to articles_path      
    else
      render :action => :new
    end
  end

  def show
    @article.view = @article.view.to_i + 1
    @article.save
    @page_title = @article.topic
    @comments = @article.comments

    if params[:comment_id]
      @comment = Comment.find(params[:comment_id])
    else
      @comment = Comment.new
    end

  end

  def edit
    @page_title = @article.topic
  end

  def update
    if @article.update(article_params)
      redirect_to article_path(@article) #:action => :show, :id => @article
      flash[:notice] = "Article was successfully updated"
    else
      render :action => :edit 
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
    flash[:alert] = "Article was successfully deleted"
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:topic, :content, :category_ids => [] )
  end

  def set_my_article
    @article = Article.find(params[:id])

    unless @article.can_edit_by?(current_user)
            redirect_to root_path
    end
  end

end