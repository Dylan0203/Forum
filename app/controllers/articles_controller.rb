class ArticlesController < ApplicationController


  before_action :set_article, :only => [ :show, :edit, :update, :destroy ]

  def index
    @articles = Article.all
  end

  def new
  @article = Article.new
  end

  def create
  @article = Article.new(article_params)
  @article.save

  redirect_to :action => :index
  end

  def show
  
  end

  def edit
  
  end

  def update
  @article.update(article_params)
  
  redirect_to :action => :show, :id => @article
  end

  def destroy
  
  @article.destroy

  redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:topic, :content)
  end
end