class ArticlesController < ApplicationController


  before_action :set_article, :only => [ :show, :edit, :update, :destroy ]

  def index
    @articles = Article.page(params[:page]).per(5)
    #@articles = Article.all
  end

  def new
  @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to :action => :index
      flash[:notice] = "Article was successfully created"
    else
      render :action => :new
    end
  end

  def show
    @page_title = @article.topic
  end

  def edit
    @page_title = @article.topic
  end

  def update
    if @article.update(article_params)
      redirect_to :action => :show, :id => @article
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
    params.require(:article).permit(:topic, :content)
  end
end